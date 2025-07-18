#! /bin/bash

bash build-app.sh emaurora
ip=$1
if [ -z "$ip" ];then
    ip=52
fi
echo "`date` start update server from device ${ip} ..."
echo "开始拷贝文件"
scp -o "ProxyCommand=nc -X connect -x 47.98.115.129:7778 %h %p" emaurora/build/AppEMAurora pi@${ip}:/home/pi/

echo "开始杀死旧的进程"
ssh -o "ProxyCommand=nc -X connect -x 47.98.115.129:7778 %h %p" pi@${ip} 'sudo systemctl stop aurora_client.service'
ssh -o "ProxyCommand=nc -X connect -x 47.98.115.129:7778 %h %p" pi@${ip} 'mv /home/pi/AppEMAurora /home/pi/client/AppEMAurora'
# scp -o "ProxyCommand=nc -X connect -x 47.98.115.129:7778 %h %p" emaurora/build/AppEMAurora pi@${ip}:/home/pi/client
echo "重新启动进程"
ssh -o "ProxyCommand=nc -X connect -x 47.98.115.129:7778 %h %p" pi@${ip} 'sudo systemctl start aurora_client.service'
echo "`date` done"