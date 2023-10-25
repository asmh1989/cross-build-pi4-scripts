#! /bin/bash

mkdir -p $HOME/raspi/rpi-sysroot
rsync -avzS --rsync-path="rsync" --delete pi@192.168.2.184:/lib* $HOME/raspi/rpi-sysroot/lib
mkdir usr
rsync -avzS --rsync-path="rsync" --delete pi@192.168.2.184:/usr/include/* $HOME/raspi/rpi-sysroot/usr/include
rsync -avzS --rsync-path="rsync" --delete pi@192.168.2.184:/usr/lib/* $HOME/raspi/rpi-sysroot/usr/lib
mkdir opt
# rsync -avzS --rsync-path="rsync" --delete pi@192.168.2.184:/opt/vc $HOME/raspi/rpi-sysroot/opt/vc