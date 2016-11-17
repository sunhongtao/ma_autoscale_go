/*
AutoSacle for SDDCOS, China Mobile Zhejiang Co. Ltd.
By Hunter
*/

package api

import (
	"autoscale/configuration"
	"autoscale/scalepolicy"
	"database/sql"
	"encoding/json"
	"fmt"
	"github.com/ant0ine/go-json-rest/rest"
	_ "github.com/go-sql-driver/mysql"
	"github.com/julienschmidt/httprouter"
	"io/ioutil"
	"log"
	"net/http"
	"sync"
	"time"
)

type ServiceAPI struct {
	Config    *configuration.Configuration
	ScaleList *scalepolicy.ScaleList
}

var lock = sync.RWMutex{}

func (d *ServiceAPI) PostPolicy(w rest.ResponseWriter, r *rest.Request) {
	asc := scalepolicy.AppScale{}
	lock.RLock()
	var err error
	err = r.DecodeJsonPayload(&asc)
	if err != nil {
		rest.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	conf := configuration.FromEnv()
	db, err := sql.Open("mysql", conf.DcosDSN)
	if err != nil {
		//log.Printf("ERROR Open database error: %s\n", err)
		rest.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	defer db.Close()
	sql_statement := "insert dcos_autoscale_policy values (?,?,?,?,?)"
	//insert data
	stmt, err := db.Prepare(sql_statement)
	var b []byte
	b, err = json.Marshal(asc.AppScalePolicy)
	if err != nil {
		rest.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	res, err := stmt.Exec(conf.Marathon.Endpoint, asc.AppId, asc.AutoScaleAdmin, b, time.Now())
	if err != nil {
		stmt, err := db.Prepare("update dcos_autoscale_policy set autoscale_admin=?,scale_policy=?,last_scale=? where marathon_endpoint=? and app_id=?")
		res1, err := stmt.Exec(asc.AutoScaleAdmin, b, time.Now(), conf.Marathon.Endpoint, asc.AppId)
		if err != nil {
			rest.Error(w, err.Error(), http.StatusInternalServerError)
			return
		}
		id, err := res1.LastInsertId()
		fmt.Println(id)
		lock.RUnlock()
		w.WriteJson(asc)
		return	
	}
	id, err := res.LastInsertId()
	fmt.Println(id)
	lock.RUnlock()
	w.WriteJson(asc)
}

func (d *ServiceAPI) GetAllPolicies(w rest.ResponseWriter, r *rest.Request) {
	//js,_:=json.MarshalIndent(d.ScaleList, "","  ")
	w.WriteJson(d.ScaleList)
}

func (d *ServiceAPI) GetPolicy(w rest.ResponseWriter, r *rest.Request) {
	lock.RLock()
	appid := r.PathParam("APPID")
	found := false
	for _, sc := range *d.ScaleList {
		if sc.AppId == appid {
			lock.RUnlock()
			w.WriteJson(sc)
			found = true
			break
		}
	}
	if !found {
		rest.NotFound(w, r)
		return
	}
}

func (d *ServiceAPI) DeletePolicy(w rest.ResponseWriter, r *rest.Request) {
	appid := r.PathParam("APPID")
	lock.RLock()
	conf := configuration.FromEnv()
	db, err := sql.Open("mysql", conf.DcosDSN)
	if err != nil {
		log.Printf("ERROR Open database error: %s\n", err)
		return
	}
	defer db.Close()
	sql_statement := "delete from dcos_autoscale_policy where app_id=?"
	//delete data
	stmt, err := db.Prepare(sql_statement)
	res, err := stmt.Exec(appid)
	if err != nil {
		rest.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	id, err := res.LastInsertId()
	fmt.Println(id)
	lock.RUnlock()
	w.WriteJson(map[string]string{"Status": "OK!"})
}

func (d *ServiceAPI) GetAll(w http.ResponseWriter, r *http.Request, _ httprouter.Params) {
	//TODO: not standard json returned
	js, _ := json.MarshalIndent(d.ScaleList, "", "  ")
	w.Header().Set("Content-Type", "application/json")
	w.Write(js)
	//fmt.Fprintf(w, "%s\n", js)
}

func (d *ServiceAPI) Get(w http.ResponseWriter, r *http.Request, ps httprouter.Params) {
	//fmt.Fprintf(w, "hello, %s!\n", ps.ByName("APPID"))

	w.Header().Set("Content-Type", "application/json")
	found := false
	for _, sc := range *d.ScaleList {
		if sc.AppId == ps.ByName("APPID") {
			js, _ := json.MarshalIndent(sc, "", "  ")
			w.Write(js)
			found = true
			break
		}
	}
	//TODO: not found, http status? json?
	if !found {
		fmt.Fprintf(w, "Not Found\n")
	}
}

func (d *ServiceAPI) Set(w http.ResponseWriter, r *http.Request, ps httprouter.Params) {
	defer r.Body.Close()
	result, _ := ioutil.ReadAll(r.Body)
	fmt.Printf("%s\n", result)
	//fmt.Fprintf(w, "Set, %s\n",result)
	//fmt.Fprintf(w, "Set, %s!\n", ps.ByName("APPID"))
	w.Header().Set("Content-Type", "application/json")
	found := false
	for _, sc := range *d.ScaleList {
		//fmt.Fprintf(w, "hello, %s,%s!\n", ps.ByName("APPID"),sc.AppId)
		if sc.AppId == ps.ByName("APPID")[1:] {
			js, _ := json.MarshalIndent(sc, "", "  ")
			w.Write(js)
			found = true
			break
		}
	}
	//TODO: not found, http status? json?
	if !found {
		fmt.Fprintf(w, "%s Not Found\n", ps.ByName("APPID")[1:])
	}

}

func responseError(w http.ResponseWriter, message string) {
	http.Error(w, message, http.StatusBadRequest)
}

func responseJSON(w http.ResponseWriter, data interface{}) {
	w.Header().Set("Content-Type", "application/json")
	bites, _ := json.Marshal(data)
	w.Write(bites)
}
