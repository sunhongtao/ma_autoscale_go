#/bin/sh
#must
export AUTOSCALE_MARATHON_ENDPOINT=http://20.26.2.20:8080
export AUTOSCALE_MARATHON_USER=dcosadmin
export AUTOSCALE_MARATHON_PASSWORD=zjdcos01
export AUTOSCALE_METRIC_INFLUXDB=http://20.26.20.25:8086
export AUTOSCALE_DCOS_DSN="root:root@tcp(20.26.17.137:3366)/go_autoscale?charset=utf8"
export AUTOSCALE_DCOS_MYSQLSYS="root:root@tcp(20.26.17.137:3366)/mysql?charset=utf8"
#optional
export AUTOSCALE_CHECK_INTERVAL=30
#./autoscale
go run autoscale.go 
