/*
AutoSacle for SDDCOS, China Mobile Zhejiang Co. Ltd.
By Zhong ChuJian
Most Code from QubitProducts/bamboo/services/marathon/
*/

package marathon

import (
	"autoscale/configuration"
	"bytes"
	"crypto/md5"
	"crypto/rand"
	"database/sql"
	"encoding/base64"
	"encoding/hex"
	"encoding/json"
	"fmt"
	_ "github.com/go-sql-driver/mysql"
	"io"
	"io/ioutil"
	"log"
	"net/http"
	"sort"
	"strconv"
	"strings"
	"time"
)

// Describes an app process running
type Task struct {
	Id    string
	Host  string
	Port  int
	Ports []int
}

// A health check on the application
type HealthCheck struct {
	// One of TCP, HTTP or COMMAND
	Protocol string
	// The path (if Protocol is HTTP)
	Path string
	// The position of the port targeted in the ports array
	PortIndex int
}

// An app may have multiple processes
type App struct {
	Id                  string
	MesosDnsId          string
	EscapedId           string
	HealthCheckPath     string
	HealthCheckProtocol string
	HealthChecks        []HealthCheck
	Tasks               []Task
	ServicePort         int
	ServicePorts        []int
	Env                 map[string]string
	Labels              map[string]string
}

type AppList []App

func (slice AppList) Len() int {
	return len(slice)
}

func (slice AppList) Less(i, j int) bool {
	return slice[i].Id < slice[j].Id
}

func (slice AppList) Swap(i, j int) {
	slice[i], slice[j] = slice[j], slice[i]
}

type marathonTaskList []marathonTask

type marathonTasks struct {
	Tasks marathonTaskList `json:"tasks"`
}

type marathonTask struct {
	AppId        string
	Id           string
	Host         string
	Ports        []int
	ServicePorts []int
	StartedAt    string
	StagedAt     string
	Version      string
}

func (slice marathonTaskList) Len() int {
	return len(slice)
}

func (slice marathonTaskList) Less(i, j int) bool {
	return slice[i].Id < slice[j].Id
}

func (slice marathonTaskList) Swap(i, j int) {
	slice[i], slice[j] = slice[j], slice[i]
}

type marathonApps struct {
	Apps []marathonApp `json:"apps"`
}

type marathonApp struct {
	Id           string                `json:"id"`
	Instances    int                   `json:"instances"`
	HealthChecks []marathonHealthCheck `json:"healthChecks"`
	Ports        []int                 `json:"ports"`
	Env          map[string]string     `json:"env"`
	Labels       map[string]string     `json:"labels"`
}

type marathonHealthCheck struct {
	Path      string `json:"path"`
	Protocol  string `json:"protocol"`
	PortIndex int    `json:"portIndex"`
}

func fetchMarathonApps(endpoint string, conf *configuration.Configuration) (map[string]marathonApp, error) {
	client := &http.Client{}
	req, _ := http.NewRequest("GET", endpoint+"/v2/apps", nil)
	req.Header.Add("Accept", "application/json")
	req.Header.Add("Content-Type", "application/json")
	if len(conf.Marathon.User) > 0 && len(conf.Marathon.Password) > 0 {
		req.SetBasicAuth(conf.Marathon.User, conf.Marathon.Password)
	}
	response, err := client.Do(req)

	if err != nil {
		return nil, err
	}

	defer response.Body.Close()
	var appResponse marathonApps

	contents, err := ioutil.ReadAll(response.Body)
	if err != nil {
		return nil, err
	}

	err = json.Unmarshal(contents, &appResponse)
	if err != nil {
		return nil, err
	}

	dataById := map[string]marathonApp{}

	for _, appConfig := range appResponse.Apps {
		if appConfig.Instances != 0 {
			dataById[appConfig.Id] = appConfig
		}
	}

	return dataById, nil
}

func fetchTasks(endpoint string, conf *configuration.Configuration) (map[string]marathonTaskList, error) {
	client := &http.Client{}
	req, _ := http.NewRequest("GET", endpoint+"/v2/tasks", nil)
	req.Header.Add("Accept", "application/json")
	req.Header.Add("Content-Type", "application/json")
	if len(conf.Marathon.User) > 0 && len(conf.Marathon.Password) > 0 {
		req.SetBasicAuth(conf.Marathon.User, conf.Marathon.Password)
	}
	response, err := client.Do(req)

	var tasks marathonTasks

	if err != nil {
		return nil, err
	}

	contents, err := ioutil.ReadAll(response.Body)
	defer response.Body.Close()
	if err != nil {
		return nil, err
	}

	err = json.Unmarshal(contents, &tasks)
	if err != nil {
		return nil, err
	}

	taskList := tasks.Tasks
	sort.Sort(taskList)

	tasksById := map[string]marathonTaskList{}
	for _, task := range taskList {
		if tasksById[task.AppId] == nil {
			tasksById[task.AppId] = marathonTaskList{}
		}
		tasksById[task.AppId] = append(tasksById[task.AppId], task)
	}

	for _, task_list := range tasksById {
		sort.Sort(task_list)
	}

	return tasksById, nil
}

func createApps(tasksById map[string]marathonTaskList, marathonApps map[string]marathonApp) AppList {

	apps := AppList{}

	for appId, mApp := range marathonApps {

		// Try to handle old app id format without slashes
		appPath := appId
		if !strings.HasPrefix(appId, "/") {
			appPath = "/" + appId
		}

		// build App from marathonApp
		app := App{
			Id:                  appPath,
			MesosDnsId:          getMesosDnsId(appPath),
			EscapedId:           strings.Replace(appId, "/", "::", -1),
			HealthCheckPath:     parseHealthCheckPath(mApp.HealthChecks),
			HealthCheckProtocol: parseHealthCheckProtocol(mApp.HealthChecks),
			Env:                 mApp.Env,
			Labels:              mApp.Labels,
		}

		app.HealthChecks = make([]HealthCheck, 0, len(mApp.HealthChecks))
		for _, marathonCheck := range mApp.HealthChecks {
			check := HealthCheck{
				Protocol:  marathonCheck.Protocol,
				Path:      marathonCheck.Path,
				PortIndex: marathonCheck.PortIndex,
			}
			app.HealthChecks = append(app.HealthChecks, check)
		}

		if len(mApp.Ports) > 0 {
			app.ServicePort = mApp.Ports[0]
			app.ServicePorts = mApp.Ports
		}

		// build Tasks for this App
		tasks := []Task{}
		for _, mTask := range tasksById[appId] {
			if len(mTask.Ports) > 0 {
				t := Task{
					Id:    mTask.Id,
					Host:  mTask.Host,
					Port:  mTask.Ports[0],
					Ports: mTask.Ports,
				}
				tasks = append(tasks, t)
			}
		}
		app.Tasks = tasks

		apps = append(apps, app)
	}
	return apps
}

func getMesosDnsId(appPath string) string {
	// split up groups and recombine for how mesos-dns/consul/etc use service name
	//   "/nested/group/app" -> "app-group-nested"
	groups := strings.Split(appPath, "/")
	reverseGroups := []string{}
	for i := len(groups) - 1; i >= 0; i-- {
		if groups[i] != "" {
			reverseGroups = append(reverseGroups, groups[i])
		}
	}
	return strings.Join(reverseGroups, "-")
}

func parseHealthCheckPath(checks []marathonHealthCheck) string {
	for _, check := range checks {
		if check.Protocol != "HTTP" && check.Protocol != "HTTPS" {
			continue
		}
		return check.Path
	}
	return ""
}

/* maybe combine this with the above? */
func parseHealthCheckProtocol(checks []marathonHealthCheck) string {
	for _, check := range checks {
		if check.Protocol != "HTTP" && check.Protocol != "HTTPS" {
			continue
		}
		return check.Protocol
	}
	return ""
}

/*
generate uuid
*/
//生成32位md5字串
func GetMd5String(s string) string {
	h := md5.New()
	h.Write([]byte(s))
	return hex.EncodeToString(h.Sum(nil))
}

//生成Guid字串
func GetGuid() string {
	b := make([]byte, 48)

	if _, err := io.ReadFull(rand.Reader, b); err != nil {
		return ""
	}
	return GetMd5String(base64.URLEncoding.EncodeToString(b))
}

/*
	Apps returns a struct that describes Marathon current app and their
	sub tasks information.
	Parameters:
		endpoint: Marathon HTTP endpoint, e.g. http://localhost:8080
*/
func FetchApps(maraconf configuration.Marathon, conf *configuration.Configuration) (AppList, error) {

	var applist AppList
	var err error

	// try all configured endpoints until one succeeds
	for _, url := range maraconf.Endpoints() {
		applist, err = _fetchApps(url, conf)
		if err == nil {
			return applist, err
		}
	}
	// return last error
	return nil, err
}

func _fetchApps(url string, conf *configuration.Configuration) (AppList, error) {
	tasks, err := fetchTasks(url, conf)
	if err != nil {
		return nil, err
	}

	marathonApps, err := fetchMarathonApps(url, conf)
	if err != nil {
		return nil, err
	}

	apps := createApps(tasks, marathonApps)
	sort.Sort(apps)
	return apps, nil
}

func ScaleApp(appId string, tasks int, origin int, conf *configuration.Configuration) error {
	var err error
	for _, endpoint := range conf.Marathon.Endpoints() {
		err = _scaleApp(appId, tasks, endpoint, conf)
		if err == nil {
			return nil
		}
	}
	return err
}
func Updatepolicy(appId string) {
	var err error
	conf :=configuration.FromEnv()
	db, err:=sql.Open("mysql", conf.DcosDSN)
	if err != nil {
		log.Printf("Error Open database error : %s\n", err)
	}
	defer db.Close()
	sql_statement := "update dcos_autoscale_policy set last_scale=? where app_id=?"
	stmt, err := db.Prepare(sql_statement)
	scale_time := time.Now().Format("2006-01-02 15:04:05")
	res, _ := stmt.Exec(scale_time,appId)
	c, _:= res.RowsAffected()
	log.Println("update affected rows:", c)
}
func Insertsyslog(appId string, tasks int, origin int) {
	var err error
	appId = appId[1:]
	conf := configuration.FromEnv()
	db, err := sql.Open("mysql", conf.DcosDSN)
	if err != nil {
		log.Printf("ERROR Open database error: %s\n", err)
		return
	}
	defer db.Close()
	rows,_ := db.Query("select app_name from cfg_app_public where app_id=%s",appId)
	var appname string
	for rows.Next() {
		err := rows.Scan(&appname)
		checkErr(err)
	}
	log.Printf("=============debug===========appname",appname)
	sql_statement := "insert sys_log SET type=?,time=?,username=?,info=?,seq=?,lv=?,op_obj=?,app_id=?,msg_status=?,RESULT=?"
	if tasks > origin {
		stmt, err := db.Prepare(sql_statement)
		checkErr(err)
		info := fmt.Sprintf("模块名称: %s,自动扩容成功,描述:实例数从%d扩至%d", appname, origin, tasks)
		seq := GetGuid()
		scale_time := time.Now().Format("2006-01-02 15:04:05")
		res, err := stmt.Exec("自动扩容", scale_time, "admin", info, seq, "INFO", "SCALE", appId, 0, "成功")
		checkErr(err)
		id, err := res.LastInsertId()
		fmt.Println(id)
	} else if tasks < origin {
		stmt, err := db.Prepare(sql_statement)
		checkErr(err)
		info := fmt.Sprintf("模块名称: %s,自动缩容成功,描述:实例数从%d缩至%d", appname, origin, tasks)
		seq := GetGuid()
		scale_time := time.Now().Format("2006-01-02 15:04:05")
		res, err := stmt.Exec("自动缩容", scale_time, "admin", info, seq, "INFO", "SCALE", appId, 0, "成功")
		checkErr(err)
		id, err := res.LastInsertId()
		fmt.Println(id)
	}
}

func checkErr(err error) {
	if err != nil {
		fmt.Println(err)
	}
}

func _scaleApp(appId string, tasks int, endpoint string, conf *configuration.Configuration) error {
	b := bytes.NewBufferString("{\"instances\":" + strconv.Itoa(tasks) + "}")
	//fmt.Println(b)
	//fmt.Println(endpoint)
	//fmt.Println(appId)

	client := &http.Client{}
	req, _ := http.NewRequest("PUT", endpoint+"/v2/apps"+appId, b)
	req.Header.Add("Accept", "application/json")
	req.Header.Add("Content-Type", "application/json")
	if len(conf.Marathon.User) > 0 && len(conf.Marathon.Password) > 0 {
		req.SetBasicAuth(conf.Marathon.User, conf.Marathon.Password)
	}

	resp, err := client.Do(req)

	if err != nil {
		return err
	}

	if resp.StatusCode != http.StatusOK {
		return fmt.Errorf("Bad HTTP Response: %v", resp.Status)
	}

	defer resp.Body.Close()
	/*
		contents, err := ioutil.ReadAll(resp.Body)
		if err != nil {
			return nil, err
		}
	*/
	return nil
}
