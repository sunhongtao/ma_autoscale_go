/*
AutoSacle for SDDCOS, China Mobile Zhejiang Co. Ltd. 
By Hunter
*/

package configuration

import (
	"log"
	"os"
	"strconv"
	"strings"
	//"time"
)

var logger = log.New(os.Stdout, "", log.Ldate|log.Ltime|log.Lshortfile)


/*
	Mesos Marathon configuration
*/
type Marathon struct {
	// comma separated marathon http endpoints including port number
	Endpoint string
	User     string
	Password string

	UseEventStream bool
}

type Configuration struct {
	// Marathon
	Marathon Marathon

	// InfluxDB 
	MetricInfluxdb string

	// Database uri
	DcosDSN string
	
	//database testuri
	DcosMYSQLSYS string
	
	// Check interval
	CheckInterval int64

}

func (m Marathon) Endpoints() []string {
	return strings.Split(m.Endpoint, ",")
}


func FromEnv() Configuration {
	conf := &Configuration{}
	//must
	setValueFromEnv(&conf.Marathon.Endpoint, "AUTOSCALE_MARATHON_ENDPOINT")
	setValueFromEnv(&conf.Marathon.User, "AUTOSCALE_MARATHON_USER")
	setValueFromEnv(&conf.Marathon.Password, "AUTOSCALE_MARATHON_PASSWORD")
	setValueFromEnv(&conf.MetricInfluxdb, "AUTOSCALE_METRIC_INFLUXDB")
	setValueFromEnv(&conf.DcosDSN, "AUTOSCALE_DCOS_DSN")
	setValueFromEnv(&conf.DcosMYSQLSYS, "AUTOSCALE_DCOS_MYSQLSYS")
	//optional
	setIntValueFromEnv(&conf.CheckInterval, "AUTOSCALE_CHECK_INTERVAL")
	
	return *conf
}

func setValueFromEnv(field *string, envVar string) {
	env := os.Getenv(envVar)
	if len(env) > 0 {
		log.Printf("INFO Using environment override %s=%s", envVar, env)
		*field = env
	}
}

func setBoolValueFromEnv(field *bool, envVar string) {
	env := os.Getenv(envVar)
	if len(env) > 0 {
		log.Printf("INFO Using environment override %s=%s", envVar, env)
		x, err := strconv.ParseBool(env)
		if err != nil {
			log.Printf("ERROR Error converting boolean value: %s\n", err)
		}
		*field = x
	} else {
		log.Printf("WARN Environment variable not set: %s", envVar)
	}
}

func setIntValueFromEnv(field *int64, envVar string) {
	env := os.Getenv(envVar)
	if len(env) > 0 {
		log.Printf("INFO Using environment override %s=%s", envVar, env)
		x, err := strconv.ParseInt(env, 10, 64)
		if err != nil {
			log.Printf("ERROR Error converting int value: %s\n", err)
		}
		*field = x
	} else {
		log.Printf("WARN Environment variable not set: %s", envVar)
	}
}
