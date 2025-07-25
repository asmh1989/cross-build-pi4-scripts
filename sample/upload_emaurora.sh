#! /bin/bash

bash build-app.sh emaurora
ip=$1
if [ -z "$ip" ];then
    ip=52
fi
echo "`date` start update server from 192.168.2.${ip} ..."
echo "开始杀死旧的进程"
ssh pi@192.168.2.${ip} 'systemctl --user stop aurora_client.service'
./upx -5 emaurora/build/AppEMAurora
scp emaurora/build/AppEMAurora pi@192.168.2.${ip}:/home/pi/client
echo "重新启动进程"
ssh pi@192.168.2.${ip} 'systemctl --user start aurora_client.service'
echo "`date` done"