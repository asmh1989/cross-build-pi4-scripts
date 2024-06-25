#! /bin/bash
cd $1
# git pull origin master
docker run -v $HOME/raspi:/root/raspi asmh1989/build-pi-ubuntu bash /root/raspi/sample/qt.sh $1 $2