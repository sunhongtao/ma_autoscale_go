/*
AutoSacle for SDDCOS, China Mobile Zhejiang Co. Ltd. 
By Zhong ChuJian
*/

package scalepolicy

import (
	"encoding/json"
	"database/sql"
	"regexp"
	"sort"
	"os"
	"log"
	//"time"
)

var logger = log.New(os.Stdout, "", log.Ldate|log.Ltime|log.Lshortfile)

type StaticScalePolicy struct {
	Enable    		bool			`json:"enable"`
	ScalePoints 	ScalePoints		`json:"scalePoints"`
}

type CpuScalePolicy struct {
	Enable    		bool	`json:"enable"`
	MinCpuPercent 	int		`json:"minCpuPercent"`
	MaxCpuPercent 	int		`json:"maxCpuPercent"`
	ScaleOutPercent	int		`json:"scaleOutPercent"`
}

type ConcurrentScalePolicy struct {
	Enable    		bool	`json:"enable"`
	MinConcurrent 	int		`json:"minConcurrent"`
	MaxConcurrent 	int		`json:"maxConcurrent"`
	ScaleOutPercent	int		`json:"scaleOutPercent"`
}

type ScalePolicy struct {
	StaticScalePolicy    	StaticScalePolicy  		`json:"staticScalePolicy"`
	CpuScalePolicy			CpuScalePolicy	  		`json:"cpuScalePolicy"`
	ConcurrentScalePolicy 	ConcurrentScalePolicy 	`json:"concurrentScalePolicy"`
}

type AppScalePolicy struct {
	AppId               string			`json:"appId"`
	AutoScale           bool			`json:"autoScale"`
	MinTasks         	int				`json:"minTasks"`
	MaxTasks	     	int				`json:"maxTasks"`
	CooldownSeconds 	int				`json:"cooldownSeconds"`
	ScalePolicy         ScalePolicy     `json:"scalePolicy"`
}

type AppScale struct {
	AppId               string			`json:"appId"`
	AutoScaleAdmin		bool			`json:"autoScaleAdmin"`
	LastScale			string 			`json:"lastScale"`
	AppScalePolicy      AppScalePolicy  `json:"appScalePolicy"`   
}

type ScaleList []AppScale

type ScalePoint struct {
	Time    		string		`json:"time"`
	Tasks			int			`json:"tasks"` 	
}

type ScalePoints []ScalePoint
 
func (p ScalePoints) Len() int {    
    return len(p)
}

func (p ScalePoints) Swap(i, j int) {     
    p[i], p[j] = p[j], p[i]
}

func (p ScalePoints) Less(i, j int) bool {    
    return p[j].Time < p[i].Time
}


func FromDB(db *sql.DB, marathon string) (ScaleList, error) {
    rows, err := db.Query("select app_id, autoscale_admin, scale_policy from dcos_autoscale_policy where marathon_endpoint='" + marathon + "'")
    if err != nil {
       return nil, err
    }
    defer rows.Close()
    scalelist := ScaleList{}
    for rows.Next() {
        //var appid 	string
        //var autoadmin bool
        var contents string
        var policy AppScalePolicy
        var scale AppScale
        rows.Scan(&scale.AppId, &scale.AutoScaleAdmin, &contents)
        err = json.Unmarshal([]byte(contents), &policy)
		if err != nil {
			log.Printf("ERROR Scale policy unmarshal error: AppID is %s\n", scale.AppId)
			goto A
		}
		if scale.AppId != policy.AppId {
			log.Printf("ERROR Scale policy ID is not matched: AppID-DB is %s, AppID-json is %s\n", scale.AppId, policy.AppId)
			goto A
		}
		//check time format is legal or not
		for _, v := range policy.ScalePolicy.StaticScalePolicy.ScalePoints {		
			match, _ := regexp.MatchString("^(([0-1][0-9])|([2][0-3])):([0-5][0-9])$", v.Time)
			if !match {
				log.Printf("ERROR Static scale point format error: AppID is %s, Time is %s\n", scale.AppId, v.Time)
				goto A
			}
		}
		//sort by time
		sort.Sort(sort.Reverse(ScalePoints(policy.ScalePolicy.StaticScalePolicy.ScalePoints)))
		scale.AppScalePolicy = policy
		scalelist = append(scalelist, scale)
		A:
    }
    return scalelist, nil	
}
