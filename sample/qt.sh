#! /bin/bash

cd $HOME/raspi/sample/$1
mkdir -p build
cd build

version=$2
if [ -z "$version" ];then
    version=6.6.2
fi

echo "use version = $version  2 = $2"
# ~/raspi/qt-pi-64/6.5.3/bin/qt-cmake ..
~/raspi/qt-pi-64/6.6.2/bin/qt-cmake .. #-DCMAKE_BUILD_TYPE=Debug 
cmake --build . --parallel 8