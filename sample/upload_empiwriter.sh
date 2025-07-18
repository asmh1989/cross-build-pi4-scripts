#! /bin/bash

bash build-app.sh empiwriter
ip=$1
if [ -z "$ip" ];then
    ip=52
fi
echo "`date` start update server from 192.168.2.${ip} ..."
# echo "开始杀死旧的进程"
# ssh pi@192.168.2.${ip} 'sudo systemctl stop aurora_client.service'
ssh pi@192.168.2.${ip} 'mkdir -p /home/pi/.config/indoor/'
ssh pi@192.168.2.${ip} 'mkdir -p /home/pi/.config/indoor2/'
ssh pi@192.168.2.${ip} 'mkdir -p /home/pi/.config/indoor3/'

scp empiwriter/build/appEmPiWriter pi@192.168.2.${ip}:/home/pi/.config/indoor/appEmPiWriter 
scp empiwriter/build/appEmPiWriter pi@192.168.2.${ip}:/home/pi/.config/indoor2/appEmPiWriter 
scp empiwriter/build/appEmPiWriter pi@192.168.2.${ip}:/home/pi/.config/indoor3/appEmPiWriter 

# echo "重新启动进程"
# ssh pi@192.168.2.${ip} 'sudo systemctl start aurora_client.service'
echo "`date` done"