#! /bin/bash

bash build-app.sh fcitx5-qt
ip=$1
if [ -z "$ip" ];then
    ip=52
fi
# echo "`date` start update server from 192.168.2.${ip} ..."
# echo "开始杀死旧的进程"
# ssh pi@192.168.2.${ip} 'sudo systemctl stop aurora_client.service'
# scp emaurora68/build/AppEMAurora pi@192.168.2.${ip}:/home/pi/client
# echo "重新启动进程"
# ssh pi@192.168.2.${ip} 'sudo systemctl start aurora_client.service'
# echo "`date` done"