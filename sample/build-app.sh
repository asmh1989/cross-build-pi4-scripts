#! /bin/bash
cd $1
# git pull origin master
docker run -v $HOME/raspi6:/root/raspi asmh1989/build-pi-debian12 bash /root/raspi/sample/qt.sh $1 $2