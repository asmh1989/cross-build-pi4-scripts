#! /bin/bash

cd $HOME/raspi/sample/$1
mkdir build
cd build

~/raspi/qt-pi-64/6.5.3/bin/qt-cmake ..
cmake --build . --parallel 8