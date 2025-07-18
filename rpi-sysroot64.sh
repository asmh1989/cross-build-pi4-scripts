#! /bin/bash

NAME=rpi-sysroot64
mkdir -p $HOME/raspi6/$NAME
cd $HOME/raspi6/$NAME
rsync -avzS --rsync-path="rsync" --delete pi@192.168.2.112:/lib* $HOME/raspi6/$NAME/lib
mkdir usr
rsync -avzS --rsync-path="rsync" --delete pi@192.168.2.112:/usr/include/* $HOME/raspi6/$NAME/usr/include
rsync -avzS --rsync-path="rsync" --delete pi@192.168.2.112:/usr/lib/* $HOME/raspi6/$NAME/usr/lib
mkdir opt