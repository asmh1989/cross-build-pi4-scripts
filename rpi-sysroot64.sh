#! /bin/bash

mkdir -p $HOME/raspi/rpi-sysroot64
cd $HOME/raspi/rpi-sysroot64
rsync -avzS --rsync-path="rsync" --delete pi@192.168.2.52:/lib* $HOME/raspi/rpi-sysroot64/lib
mkdir usr
rsync -avzS --rsync-path="rsync" --delete pi@192.168.2.52:/usr/include/* $HOME/raspi/rpi-sysroot64/usr/include
rsync -avzS --rsync-path="rsync" --delete pi@192.168.2.52:/usr/lib/* $HOME/raspi/rpi-sysroot64/usr/lib
mkdir opt
# rsync -avzS --rsync-path="rsync" --delete pi@192.168.2.184:/opt/vc $HOME/raspi/rpi-sysroot64/opt/vc