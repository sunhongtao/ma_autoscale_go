/*
AutoSacle for SDDCOS, China Mobile Zhejiang Co. Ltd. 
By Zhong ChuJian
*/

package api

import (
	"encoding/json"
	"net/http"
	"fmt"

	"autoscale/configuration"
	"autoscale/scalepolicy"
    "github.com/julienschmidt/httprouter"
)

type ServiceAPI struct {
	Config  *configuration.Configuration
	ScaleList *scalepolicy.ScaleList
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
    fmt.Fprintf(w, "Set, %s!\n", ps.ByName("APPID"))
}

func responseError(w http.ResponseWriter, message string) {
	http.Error(w, message, http.StatusBadRequest)
}

func responseJSON(w http.ResponseWriter, data interface{}) {
	w.Header().Set("Content-Type", "application/json")
	bites, _ := json.Marshal(data)
	w.Write(bites)
}
