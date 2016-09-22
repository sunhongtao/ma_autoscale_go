// GOLANG
//***********************************************
//
//      Filename: mysqltest.go
//
//        Author: xwisen 1031649164@qq.com
//   Description: ---
//        Create: 2016-09-21 13:58:28
// Last Modified: 2016-09-21 16:09:06
//***********************************************

package main

import (
	"database/sql"
	"encoding/json"
	_ "github.com/go-sql-driver/mysql"
	"github.com/xwisen/zcj/scalepolicy"
	"log"
	"os"
	"reflect"
	"time"
)

func main() {
	log.SetPrefix(">>>>>")
	mysqlConfig := os.Getenv("AUTOSCALE_DCOS_DSN")
	log.Printf("mysql config is : %s", mysqlConfig+"++++++++++++++++++")
	s := scalepolicy.AppScale{}
	s.AutoScaleAdmin = true
	s1 := scalepolicy.AppScale.AppScalePolicy{}
	s1.AppId = "test"
	s.AppScalePolicy = s1
	sj, err := json.Marshal(s)
	if err != nil {
		log.Printf("json marshal s  error : %s", err)
		return
	}

	db, err := sql.Open("mysql", mysqlConfig)
	if err != nil {
		log.Printf("open mysql error : %s", err)
		return
	}

	result, err := db.Exec("insert into dcos_autoscale_policy set marathon_endpoint='http://20.26.25.148:8080',app_id=?,autoscale_admin='true',scale_policy=?,ast_scale=?", s.AppId, string(sj), time.Now())
	if err != nil {
		log.Printf("insert mysql error : %s", err)
		return
	}
	log.Printf("insert mysql result : %s", reflect.TypeOf(result))
	raws, err := db.Query("select scale_policy from dcos_autoscale_policy where marathon_endpoint='http://20.26.25.148:8080'")
	log.Println(reflect.TypeOf(s))
	for raws.Next() {
		var tmp []byte
		var appscale scalepolicy.AppScale
		if err = raws.Scan(&tmp); err != nil {
			log.Printf("raws scan error : %s", err)
			return
		}
		log.Printf("raws is : ", string(tmp))
		err = json.Unmarshal(tmp, &appscale)
		if err != nil {
			log.Printf("json unmarshal error : %s", err)
			return
		}
		log.Printf("++++++++++++ is : %s", appscale.AppScalePolicy.ScalePolicy.StaticScalePolicy)

	}
}
