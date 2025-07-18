#! /bin/bash

bash build-app.sh hcdp_qml
ip=$1
if [ -z "$ip" ];then
    ip=52
fi
echo "`date` start update server from 192.168.2.${ip} ..."
ssh pi@192.168.2.${ip} 'mkdir -p /home/pi/hcdp'
scp hcdp_qml/build/apphcdp pi@192.168.2.${ip}:/home/pi/hcdp
echo "`date` done"