#/bin/sh
#must
export AUTOSCALE_MARATHON_ENDPOINT=http://20.26.28.10:8080
export AUTOSCALE_MARATHON_USER=dcosadmin
export AUTOSCALE_MARATHON_PASSWORD=zjdcos01
export AUTOSCALE_METRIC_INFLUXDB=http://20.26.28.19:8086
export AUTOSCALE_DCOS_DSN="root:root@tcp(20.26.28.19:3366)/icloud"
export AUTOSCALE_DCOS_MYSQLSYS="root:root@tcp(20.26.28.19:3366)/mysql"
#optional
export AUTOSCALE_CHECK_INTERVAL=30
#./autoscale_four
go run autoscale.go 
