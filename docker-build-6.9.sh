#! /bin/bash
#sudo docker build -t asmh1989/build-pi-ubuntu .
docker run -v $HOME/raspi:/root/raspi asmh1989/build-pi-ubuntu-69 bash /root/raspi/$1