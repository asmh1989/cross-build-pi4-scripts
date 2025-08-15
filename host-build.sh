#! /bin/bash
ROOT_HOME=$HOME/raspi

QT_SRC=$ROOT_HOME/qt5
version=`cd $QT_SRC && git branch --show-current`
HOST_DIR=$ROOT_HOME/qt-host/$version
WORK_HOME=$ROOT_HOME/build/host-$version
# rm -rf $WORK_HOME
mkdir -p $WORK_HOME
mkdir -p $HOST_DIR
cd $WORK_HOME

function build_qt6(){
    cmake $ROOT_HOME/qt5/$1 -GNinja -DCMAKE_BUILD_TYPE=Release -DQT_BUILD_EXAMPLES=OFF -DQT_BUILD_TESTS=OFF -DCMAKE_INSTALL_PREFIX=$HOST_DIR
    cmake --build . --parallel 8
    cmake --install .
}

function build_qt6_2(){
    mkdir -p $WORK_HOME/$1
    cd $WORK_HOME/$1
    $HOST_DIR/bin/qt-configure-module  $ROOT_HOME/qt5/$1
    cmake --build . --parallel 8
    cmake --install .
}

build_qt6 qtbase

# build_qt6_2 qtshadertools

# build_qt6_2 qtdeclarative 

# build_qt6_2 qtserialport

# build_qt6_2 qtvirtualkeyboard

# build_qt6_2 qtcharts

echo "done .."