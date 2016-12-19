package main

import (
	"fmt"
	"time"

	"github.com/influxdata/influxdb/client/v2"
)


func main() {

	// Make client
	c, err := client.NewHTTPClient(client.HTTPConfig{
    	Addr: "http://20.26.25.120:8086",
	})
	if err != nil {
    	fmt.Println("Error creating InfluxDB Client: ", err.Error())
	}
	defer c.Close()

	q := client.NewQuery("CREATE DATABASE dcos", "", "")
	if response, err := c.Query(q); err == nil && response.Error() == nil {
    	fmt.Println(response.Results)
	}

	// Create a new point batch
	bp, _ := client.NewBatchPoints(client.BatchPointsConfig{
	    Database:  "dcos",
	    Precision: "ms",
	})
	
	// Create a point and add to batch
	tags := map[string]string{"":""}
	fields := map[string]interface{}{
	    "container_appid":   "scrm-web",
	    "container_cpu_used": 53.4,
	}
	pt, err := client.NewPoint("container1", tags, fields, time.Now())
	if err != nil {
	    fmt.Println("Error: ", err.Error())
	}
	bp.AddPoint(pt)
	
	// Write the batch
	c.Write(bp)

	
	q1 := fmt.Sprintf("SELECT MEAN(container_cpu_used) FROM container1 WHERE container_appid='%s' and time>now() - 1m", "scrm-web")
	//fmt.Println(q)
	//q1 := "SELECT MEAN(container_cpu_used) FROM container1 WHERE container_appid='scrm-web' and time>now() - 1m"
	res, err := queryDB(c, q1)
	if err != nil {
    	fmt.Println("Error: ", err.Error())
	}
	
	fmt.Println(res)
	//fmt.Println(len(res))
	//val := res[0].Series[0].Values[0][1]
    //fmt.Println(val)
   
    if len(res[0].Series) == 0 {
    	fmt.Println("111")
    } else {
    	fmt.Println(res[0].Series[0].Values[0][1])
    }
    

}


func queryDB(clnt client.Client, cmd string) (res []client.Result, err error) {
    q := client.Query{
        Command:  cmd,
        Database: "dcos",
    }
    if response, err := clnt.Query(q); err == nil {
        if response.Error() != nil {
            return res, response.Error()
        }
        res = response.Results
    } else {
        return res, err
    }
    return res, nil
}
