/*
AutoSacle for SDDCOS, China Mobile Zhejiang Co. Ltd. 
By Zhong ChuJian
*/

package metrics

import (
	"fmt"
	"errors"
	"strconv"
	//"encoding/json"
	
	"autoscale/configuration"
	"github.com/influxdata/influxdb/client/v2"
)

/*
https://github.com/influxdata/influxdb/blob/master/models/rows.go
type Row struct {
	Name    string            `json:"name,omitempty"`
	Tags    map[string]string `json:"tags,omitempty"`
	Columns []string          `json:"columns,omitempty"`
	Values  [][]interface{}   `json:"values,omitempty"`
}

https://github.com/influxdata/influxdb/blob/master/client/v2/client.go
// Message represents a user message.
type Message struct {
	Level string
	Text  string
}

// Result represents a resultset returned from a single statement.
type Result struct {
	Series   []models.Row
	Messages []*Message
	Err      string `json:"error,omitempty"`
}
*/

type Metrics struct {
	Time string
	ContainerCpuUsed float64
}

func GetCpuUsage(appId string, conf *configuration.Configuration) (float64, error) {
	// Make client
	c, err := client.NewHTTPClient(client.HTTPConfig{
    	Addr: conf.MetricInfluxdb,  //"http://20.26.25.120:8086",
	})
	if err != nil {
    	//fmt.Println("Error creating InfluxDB Client: ", err.Error())
    	return -1, err
	}
	defer c.Close()
	
	q := fmt.Sprintf("SELECT MEAN(container_cpu_used) FROM container WHERE container_appid='%s' and time>now() - 62s", appId)
	res, err := queryDB(c, q)
	if err != nil {
    	//fmt.Println("Error: ", err.Error())
    	return -1, err
	}
	
    if len(res[0].Series) == 0 {
    	//fmt.Println("DDDError: Data not found!")
    	return -1, errors.New("Data not found")
    } else {
		v := fmt.Sprintf("%v", res[0].Series[0].Values[0][1])
		//fmt.Println(v)
		rt, err := strconv.ParseFloat(v, 64)
		if err != nil {
    		fmt.Println("DDDError: ", err.Error())
    		return -1, err
		}
    	return rt, nil
    }
}

func GetConcurrent(appId string, conf *configuration.Configuration) (float64, error) {
	// Make client
	c, err := client.NewHTTPClient(client.HTTPConfig{
    	Addr: conf.MetricInfluxdb,  //"http://20.26.25.120:8086",
	})
	if err != nil {
    	//fmt.Println("Error creating InfluxDB Client: ", err.Error())
    	return -1, err
	}
	defer c.Close()
	
	q := fmt.Sprintf("SELECT MEAN(container_thread_running) FROM container WHERE container_appid='%s' and time>now() - 62s", appId)
	res, err := queryDB(c, q)
	if err != nil {
    	//fmt.Println("Error: ", err.Error())
    	return -1, err
	}
	
    if len(res[0].Series) == 0 {
    	//fmt.Println("DDDError: Data not found!")
    	return -1, errors.New("Data not found")
    } else {
		v := fmt.Sprintf("%v", res[0].Series[0].Values[0][1])
		//fmt.Println(v)
		rt, err := strconv.ParseFloat(v, 64)
		if err != nil {
    		//fmt.Println("DDDError: ", err.Error())
    		return -1, err
		}
    	return rt, nil
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
