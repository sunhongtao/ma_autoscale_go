package main

import (
	"fmt"
	"time"
	"bufio"
	"io"
	"os"
	"strings"
	"strconv"
	
	"github.com/influxdata/influxdb/client/v2"
)

type Metrics struct {
	Cpu float64
	Concurrent float64
}


func main() {

	/*currentDir, _ := os.Getwd()
	fileName := currentDir + "/cpuusage.txt"
	fmt.Println(fileName)*/
	m, err := ReadLine2("/root/gows/src/github.com/xwisen/zcj/cpuusage.txt")
	fmt.Println(m)
	
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
	
	for k,v := range m {
		// Create a point and add to batch
		tags := map[string]string{}
		fields := map[string]interface{}{
		    "container_appid":   k,
		    "container_cpu_used": v.Cpu,
		    "container_thread_running": v.Concurrent,
		}
		pt, err := client.NewPoint("container", tags, fields, time.Now())
		if err != nil {
		    fmt.Println("Error: ", err.Error())
		}
		bp.AddPoint(pt)
		
		// Write the batch
		c.Write(bp)
	}
	
//container_thread_running


}

func ReadLine(fileName string) (m map[string]float64, err error) {
	m = map[string]float64{}
	f, err := os.Open(fileName)
	if err != nil {
		return m, err
	}
	buf := bufio.NewReader(f)
	for {
		line, err := buf.ReadString('\n')
		line = strings.TrimSpace(line) 
		if len(line) > 0 {
			s := strings.Split(line, " ")
			v, _ := strconv.ParseFloat(s[1], 64)
			m[s[0]] = v
		}
		if err != nil {
			if err == io.EOF {
				return m, nil
			}
			return m, err
		}
	}
	return m, nil
}

func ReadLine2(fileName string) (m map[string]Metrics, err error) {
	m = map[string]Metrics{}
	f, err := os.Open(fileName)
	if err != nil {
		return m, err
	}
	buf := bufio.NewReader(f)
	for {
		line, err := buf.ReadString('\n')
		line = strings.TrimSpace(line) 
		if len(line) > 0 {
			s := strings.Split(line, " ")
			var v Metrics
			v.Cpu, _ = strconv.ParseFloat(s[1], 64)
			v.Concurrent, _ = strconv.ParseFloat(s[2], 64)
			m[s[0]] = v
		}
		if err != nil {
			if err == io.EOF {
				return m, nil
			}
			return m, err
		}
	}
	return m, nil
}