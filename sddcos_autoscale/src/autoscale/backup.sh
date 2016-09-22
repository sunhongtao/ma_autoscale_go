#!/bin/bash
rm -f asbackup.tar
tar cvf asbackup.tar *.* scalepolicy/ configuration/ marathon/ metrics/ api/
ftp -n<<!
open 10.70.41.126
user joy go2hell
binary
cd /Temp/zcj
lcd /root/gows/src/autoscale
prompt off
put asbackup.tar
close
bye
!
