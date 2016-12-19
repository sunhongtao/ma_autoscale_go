package main

import (
	"fmt"
	"github.com/influxdata/influxdb/client/v2"
	"time"
)

func main() {
	 // Make client
        c, err := client.NewHTTPClient(client.HTTPConfig{
        Addr: "http://20.26.20.25:8086",
        })
        if err != nil {
        fmt.Println("Error creating InfluxDB Client: ", err.Error())
        }
        defer c.Close()
	q := fmt.Sprintf("SELECT MEAN(container_thread_running) FROM container WHERE container_appname='%s' and time>now() - 62s", appId)
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
		fmt.Println("=================bebug========:",rt)
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

