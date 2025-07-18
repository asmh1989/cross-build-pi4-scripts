#! /bin/bash
#sudo docker build -t asmh1989/build-pi-ubuntu .
sudo docker run -v $HOME/raspi6:/root/raspi asmh1989/build-pi-debian12 bash /root/raspi/$1