/*
AutoSacle for SDDCOS, China Mobile Zhejiang Co. Ltd.
By Zhong ChuJian
*/

package main

import (
	"database/sql"
	//"fmt"
	"encoding/json"
	"fmt"
	"log"
	"math"
	"net/http"
	"os"
	"time"

	"autoscale/api"
	"autoscale/configuration"
	"autoscale/marathon"
	"autoscale/metrics"
	"autoscale/scalepolicy"
	_ "github.com/go-sql-driver/mysql"
	"github.com/julienschmidt/httprouter"
	//_ "github.com/mattn/go-oci8"
)

var logger = log.New(os.Stdout, "", log.Ldate|log.Ltime|log.Lshortfile)

var SCALE_INTERVAL time.Duration = 10

func main() {
	os.Setenv("NLS_LANG", "AMERICAN_AMERICA.AL32UTF8")

	conf := configuration.FromEnv()
	dbsys, errsys:=sql.Open("mysql", conf.DcosMYSQLSYS)
	db, err := sql.Open("mysql", conf.DcosDSN)
	if err != nil {
		log.Printf("ERROR Open database error: %s\n", err)
		return
	}
	defer db.Close()
	defer dbsys.Close()

	if errsys= testSelect(dbsys); errsys != nil {
		log.Printf("ERROR1 Database error: %s\n", errsys)
		return
	}

	if err = createTablePolicy(db, dbsys); err != nil {
		log.Printf("ERROR Database error: %s\n", err)
		return
	}

	if err = createTableLogs(db, dbsys); err != nil {
		log.Printf("ERROR Database error: %s\n", err)
		return
	}

	//getMarathonApps(getMarathonEndpoint())
	apps, err := marathon.FetchApps(conf.Marathon, &conf)
	if err != nil {
		log.Printf("ERROR Fetch marathon apps error: %s\n", err)
	}
	al := ""
	for _, app := range apps {
		al = al + app.Id + " "
	}
	log.Printf("INFO Found %d apps in marathon: %s\n", len(apps), al)

	scalelist, err := scalepolicy.FromDB(db, conf.Marathon.Endpoint)
	if err != nil {
		log.Printf("ERROR Fetch autoscale policy from db error: %s\n", err)
	}
	js, _ := json.MarshalIndent(scalelist, "", "  ")
	log.Printf("INFO Found %d app scale policies from config: %s\n", len(scalelist), string(js))

	go func() {
		t0 := time.Now()
		for {
			t1 := time.Now()
			//TODO: Collect app info every time
			apps, err = marathon.FetchApps(conf.Marathon, &conf)
			if err != nil {
				log.Printf("ERROR Fetch marathon apps error: %s\n", err)
			}
			for _, sc := range scalelist {
				log.Println("========",sc.AutoScaleAdmin,sc.AppScalePolicy.AutoScale,sc.AppId)
				if !(sc.AutoScaleAdmin && sc.AppScalePolicy.AutoScale) {
					log.Printf("INFO App %s autoScale disabled\n", sc.AppId)
					continue	
				}
				for _, app := range apps {
					//	log.Println("appid, sc.Appid=========",app.Id,sc.AppId)
					if app.Id[1:] == sc.AppId {
						target := 0
						if sc.AppScalePolicy.ScalePolicy.StaticScalePolicy.Enable {
							log.Printf("INFO App %s staticScalePolicy enabled, Checking...\n", sc.AppId)
							target = staticScale(&app, &sc, t0, t1)
						} else {
							if sc.AppScalePolicy.ScalePolicy.ConcurrentScalePolicy.Enable {
								log.Printf("INFO App %s concurrentScalePolicy enabled, Checking...\n", sc.AppId)
								target = concurrentScale(&app, &sc, t1, &conf)
							} else {
								if sc.AppScalePolicy.ScalePolicy.CpuScalePolicy.Enable {
									log.Printf("INFO App %s cpuScalePolicy enabled, Checking...\n", sc.AppId)
									target = cpuScale(&app, &sc, t1, &conf)
								}
							}
						}
						//Do Scale
						if target > 0 && target != len(app.Tasks) {
							err := marathon.ScaleApp(app.Id, target, &conf)
							if err != nil {
								log.Printf("ERROR Scale app error: %s\n", err.Error())
							} else {
								sc.LastScale = time.Now().Format("2006-01-02 15:04:05")
							}
						}
						break
					}
				}
			}
			time.Sleep(SCALE_INTERVAL * time.Second) //TODO: more precise time
			//TODO: Update scale policy if changed

			t0 = t1
		}
	}()

	apiServer(&conf, &scalelist)
	/*
		for {
			log.Printf("*********\n")
			time.Sleep(10*time.Second)
		}
	*/
}

func apiServer(conf *configuration.Configuration, scalelist *scalepolicy.ScaleList) {
	serviceAPI := api.ServiceAPI{Config: conf, ScaleList: scalelist}

	router := httprouter.New()
	router.GET("/policy", serviceAPI.GetAll)
	router.GET("/policy/*APPID", serviceAPI.Get)
	router.POST("/policy/*APPID", serviceAPI.Set)

	log.Fatal(http.ListenAndServe(":8090", router))
}

func staticScale(app *marathon.App, sc *scalepolicy.AppScale, t0 time.Time, t1 time.Time) int {
	var message string
	conf := configuration.FromEnv()
	i := len(sc.AppScalePolicy.ScalePolicy.StaticScalePolicy.ScalePoints)
	for i := i - 1; i >= 0; i-- {
		s := t1.Format("2006-01-02 ") + sc.AppScalePolicy.ScalePolicy.StaticScalePolicy.ScalePoints[i].Time
		t, err := time.ParseInLocation("2006-01-02 15:04", s, time.Local)
		if err != nil {
			log.Printf("ERROR App %s scale point [%s] parse error\n", sc.AppId, s)
			return 0
		}

		if (t.Before(t1) && t.After(t0)) || t.Equal(t1) {
			log.Printf("INFO T0:%s T1:%s T:%s Matched\n", t0.Local(), t1.Local(), t.Local())
			message = fmt.Sprintf("INFO T0:%s T1:%s T:%s Matched\n", t0.Local(), t1.Local(), t.Local())
			return sc.AppScalePolicy.ScalePolicy.StaticScalePolicy.ScalePoints[i].Tasks //only match once
		} else {
			message = fmt.Sprintf("INFO T0:%s T1:%s T:%s Matched\n", t0.Local(), t1.Local(), t.Local())
			log.Printf("INFO T0:%s T1:%s T:%s NOT Matched\n", t0.Local(), t1.Local(), t.Local())
		}
	}
	db_operation(conf.Marathon.Endpoint, sc.AppId, message)
	return 0
}

func cpuScale(app *marathon.App, sc *scalepolicy.AppScale, t1 time.Time, conf *configuration.Configuration) int {
	var message string
	if sc.LastScale != "" {
		t, err := time.ParseInLocation("2006-01-02 15:04:05", sc.LastScale, time.Local)
		if err != nil {
			log.Printf("ERROR App %s last scale time [%s] parse error\n", sc.AppId, sc.LastScale)
			return 0
		}
		if t1.Sub(t).Seconds() < float64(sc.AppScalePolicy.CooldownSeconds) {
			log.Printf("DEBUG App %s in cool down cycle, stop checking scale\n", sc.AppId)
			return 0
		}
	}
	//TODO: When Exception, not scale

	//get cpu usage
	usage, err := metrics.GetCpuUsage(sc.AppId, conf)
	if err != nil {
		log.Printf("Error Get app %s cpu usage error: %s\n", sc.AppId, err.Error())
		return -1
	}
	if usage <= 0 {
		log.Printf("Error app %s cpu usage is %.1f, error maybe\n", sc.AppId, usage)
		return -1
	}
	//log.Printf("DEBUG app %s cpu usage is %.1f\n", sc.AppId, usage)

	minTsk := sc.AppScalePolicy.MinTasks
	maxTsk := sc.AppScalePolicy.MaxTasks
	minCpu := float64(sc.AppScalePolicy.ScalePolicy.CpuScalePolicy.MinCpuPercent)
	maxCpu := float64(sc.AppScalePolicy.ScalePolicy.CpuScalePolicy.MaxCpuPercent)
	scPct := sc.AppScalePolicy.ScalePolicy.CpuScalePolicy.ScaleOutPercent
	curTsk := len(app.Tasks)
	tgtTsk := 0
	if usage > maxCpu {
		tgtTsk = int(math.Ceil(float64(curTsk) * (1 + float64(scPct)/100)))
		if tgtTsk > maxTsk {
			tgtTsk = maxTsk
		}
		message = fmt.Sprintf("DEBUG App %s CPU usage %.1f > %.1f(max), target tasks is %d\n", sc.AppId, usage, maxCpu, tgtTsk)
		log.Printf("DEBUG App %s CPU usage %.1f > %.1f(max), target tasks is %d\n", sc.AppId, usage, maxCpu, tgtTsk)
	} else if usage < minCpu {
		tgtTsk = int(math.Floor(float64(curTsk) * (1 - float64(scPct)/500))) //Slower 5X when scale in
		if tgtTsk < minTsk {
			tgtTsk = minTsk
		}
		message = fmt.Sprintf("DEBUG App %s CPU usage %.1f < %.1f(min), target tasks is %d\n", sc.AppId, usage, minCpu, tgtTsk)
		log.Printf("DEBUG App %s CPU usage %.1f < %.1f(min), target tasks is %d\n", sc.AppId, usage, minCpu, tgtTsk)
	} else {
		message = fmt.Sprintf("DEBUG App %s CPU usage %.1f between %.1f(min) to %.1f(max), no scale\n", sc.AppId, usage, minCpu, maxCpu)
		log.Printf("DEBUG App %s CPU usage %.1f between %.1f(min) to %.1f(max), no scale\n", sc.AppId, usage, minCpu, maxCpu)
	}
	db_operation(conf.Marathon.Endpoint, sc.AppId, message)
	//log.Println("==marathon endpoint===  appid=====", conf.Marathon.Endpoint, sc.AppId)
	return tgtTsk
}

func concurrentScale(app *marathon.App, sc *scalepolicy.AppScale, t1 time.Time, conf *configuration.Configuration) int {
	var message string
	if sc.LastScale != "" {
		t, err := time.ParseInLocation("2006-01-02 15:04:05", sc.LastScale, time.Local)
		if err != nil {
			log.Printf("ERROR App %s last scale time [%s] parse error\n", sc.AppId, sc.LastScale)
			return 0
		}
		if t1.Sub(t).Seconds() < float64(sc.AppScalePolicy.CooldownSeconds) {
			log.Printf("DEBUG App %s in cool down cycle, stop checking scale\n", sc.AppId)
			return 0
		}
	}
	//TODO: When Exception, not scale

	//get cpu usage
	usage, err := metrics.GetConcurrent(sc.AppId, conf)
	if err != nil {
		log.Printf("Error Get app %s concurrent error: %s\n", sc.AppId, err.Error())
		return -1
	}
	if usage <= 0 {
		log.Printf("Error app %s concurrent is %.1f, error maybe\n", sc.AppId, usage)
		return -1
	}
	//log.Printf("DEBUG app %s concurrent is %.1f\n", sc.AppId, usage)

	minTsk := sc.AppScalePolicy.MinTasks
	maxTsk := sc.AppScalePolicy.MaxTasks
	minCcr := float64(sc.AppScalePolicy.ScalePolicy.ConcurrentScalePolicy.MinConcurrent)
	maxCcr := float64(sc.AppScalePolicy.ScalePolicy.ConcurrentScalePolicy.MaxConcurrent)
	scPct := sc.AppScalePolicy.ScalePolicy.ConcurrentScalePolicy.ScaleOutPercent
	curTsk := len(app.Tasks)
	tgtTsk := 0

	if usage > maxCcr {
		tgtTsk = int(math.Ceil(float64(curTsk) * (1 + float64(scPct)/100)))
		if tgtTsk > maxTsk {
			tgtTsk = maxTsk
		}
		message = fmt.Sprintf("DEBUG App %s concurrent %.1f > %.1f(max), target tasks is %d\n", sc.AppId, usage, maxCcr, tgtTsk)
		log.Printf("DEBUG App %s concurrent %.1f > %.1f(max), target tasks is %d\n", sc.AppId, usage, maxCcr, tgtTsk)
	} else if usage < minCcr {
		tgtTsk = int(math.Floor(float64(curTsk) * (1 - float64(scPct)/500))) //Slower 5X when scale in
		if tgtTsk < minTsk {
			tgtTsk = minTsk
		}
		message = fmt.Sprintf("DEBUG App %s concurrent %.1f < %.1f(min), target tasks is %d\n", sc.AppId, usage, minCcr, tgtTsk)
		log.Printf("DEBUG App %s concurrent %.1f < %.1f(min), target tasks is %d\n", sc.AppId, usage, minCcr, tgtTsk)
	} else {
		message = fmt.Sprintf("DEBUG App %s concurrent %.1f between %.1f(min) to %.1f(max), no scale\n", sc.AppId, usage, minCcr, maxCcr)
		log.Printf("DEBUG App %s concurrent %.1f between %.1f(min) to %.1f(max), no scale\n", sc.AppId, usage, minCcr, maxCcr)
	}
	db_operation(conf.Marathon.Endpoint, sc.AppId, message)
	return tgtTsk
}

func testSelect(db *sql.DB) error {
	rows, err := db.Query("select * from user")
	if err != nil {
		return err
	}
	defer rows.Close()

	for rows.Next() {
		var f1 string
		rows.Scan(&f1)
		log.Printf("INFO %s\n", f1)
	}
	return nil
}

func tableExists(db *sql.DB, tbName string) (bool, error) {
	rows, err := db.Query("select count(*) from innodb_table_stats where table_name='" + tbName + "'")
	if err != nil {
		return false, err
	}
	defer rows.Close()

	for rows.Next() {
		var cnt int
		rows.Scan(&cnt)
		if cnt != 0  {
			return true, nil
		}
	}
	return false, nil
}

func createTablePolicy(db *sql.DB, dbsys *sql.DB) error {
	bExist, err := tableExists(dbsys, "dcos_autoscale_policy")
	if err != nil {
		return err
	}
	if bExist {
		log.Println("INFO table DCOS_AUTOSCALE_POLICY exists.")
	} else {
		log.Println("INFO table DCOS_AUTOSCALE_POLICY not exists.")
		if _, err = db.Exec("create table dcos_autoscale_policy(" +
			"marathon_endpoint varchar(255) not null, " +
			"app_id varchar(255) not null, " +
			"autoscale_admin tinyint(10) not null, " +
			"scale_policy varchar(2000) default null, " +
			"last_scale datetime(6) not null, " +
			"primary key(marathon_endpoint, app_id) " +
			") "); err != nil {
			return err
		}
		log.Println("INFO table DCOS_AUTOSCALE_POLICY created.")
	}
	return nil
}

func createTableLogs(db *sql.DB, dbsys *sql.DB) error {
	bExist, err := tableExists(dbsys, "dcos_autoscale_logs")
	if err != nil {
		return err
	}
	if bExist {
		log.Println("INFO table DCOS_AUTOSCALE_LOGS exists.")
	} else {
		log.Println("INFO table DCOS_AUTOSCALE_LOGS not exists.")
		if _, err = db.Exec("create table dcos_autoscale_logs(" +
			"log_time datetime(6) not null, " +
			"marathon_endpoint varchar(255) not null, " +
			"app_id varchar(100) not null, " +
			"message varchar(255) not null) "); err != nil {
			return err
		}
		log.Println("INFO table DCOS_AUTOSCALE_LOGS created.")
	}
	return nil
}

func db_operation(marathon_edp string, app_id string, message string) {
	conf := configuration.FromEnv()
	db, err := sql.Open("mysql", conf.DcosDSN)
	sql_statement := "insert dcos_autoscale_logs SET log_time=?,marathon_endpoint=?,app_id=?,message=?"
	//insert data
	stmt, err := db.Prepare(sql_statement)
	checkErr(err)
	res, err := stmt.Exec(time.Now(), marathon_edp, app_id, message)
	checkErr(err)
	id, err := res.LastInsertId()
	fmt.Println(id)
}

func checkErr(err error) {
	if err != nil {
		fmt.Println(err)
	}
}
