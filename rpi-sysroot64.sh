#! /bin/bash

mkdir -p $HOME/raspi/rpi-sysroot64
cd $HOME/raspi/rpi-sysroot64
# rsync -avzS --rsync-path="rsync" --delete pi@192.168.2.112:/lib* $HOME/raspi/rpi-sysroot64/lib
# mkdir -p usr
# rsync -avzS --rsync-path="rsync" --delete pi@192.168.2.112:/usr/include/* $HOME/raspi/rpi-sysroot64/usr/include
# rsync -avzS --rsync-path="rsync" --delete pi@192.168.2.112:/usr/lib/* $HOME/raspi/rpi-sysroot64/usr/lib
# mkdir -p share
# rsync -avzS --rsync-path="rsync" --delete pi@192.168.2.112:/usr/share/* $HOME/raspi/rpi-sysroot64/usr/share

rsync -avzS --rsync-path="rsync" --delete pi@192.168.2.112:/usr/local/qt6/* /home/sun/git/pi-gen/stage3/02-custom/files/qt6
# mkdir -p opt
# rsync -avzS --rsync-path="rsync" --delete pi@192.168.2.112:/opt/vc $HOME/raspi/rpi-sysroot64/opt/vc