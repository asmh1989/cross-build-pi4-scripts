#! /bin/bash

mkdir -p $HOME/raspi/rpi-sysroot64
cd $HOME/raspi/rpi-sysroot64
rsync -avzS --rsync-path="rsync" --delete pi@192.168.2.112:/lib* $HOME/raspi/rpi-sysroot64/lib
mkdir -p usr
rsync -avzS --rsync-path="rsync" --delete pi@192.168.2.112:/usr/include/* $HOME/raspi/rpi-sysroot64/usr/include
rsync -avzS --rsync-path="rsync" --delete pi@192.168.2.112:/usr/lib/* $HOME/raspi/rpi-sysroot64/usr/lib
mkdir -p opt
rsync -avzS --rsync-path="rsync" --delete pi@192.168.2.112:/opt/vc $HOME/raspi/rpi-sysroot64/opt/vc