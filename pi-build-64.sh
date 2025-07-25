#! /bin/bash
ROOT_HOME=$HOME/raspi

QT_SRC=$ROOT_HOME/qt5
version=6.8.3
HOST_DIR=$ROOT_HOME/qt-host/$version
PI_DIR=$ROOT_HOME/qt-pi-64/$version
WORK_HOME=$ROOT_HOME/build/pi-64-$version
#rm -rf $WORK_HOME
mkdir -p $WORK_HOME
mkdir -p $PI_DIR
cd $WORK_HOME

function build_qt6() {
    # 6.6 for debian 11 编译配置
    #$QT_SRC/qtbase/configure -release -opengl es2 -nomake examples -nomake tests -qt-host-path $HOST_DIR -extprefix $PI_DIR -prefix /usr/local/qt6 -device linux-rasp-pi4-aarch64 -device-option CROSS_COMPILE=aarch64-linux-gnu- -- -DCMAKE_TOOLCHAIN_FILE=$ROOT_HOME/toolchain64.cmake -DQT_FEATURE_xcb=ON -DFEATURE_xcb_xlib=ON -DQT_FEATURE_xlib=ON -DFEATURE_dbus=OFF
    
#     cmake $QT_SRC/qtbase-everywhere-src-6.8.3/ -GNinja -GNinja -DCMAKE_BUILD_TYPE=Release -DINPUT_opengl=es2 \
# -DQT_BUILD_EXAMPLES=OFF -DQT_BUILD_TESTS=OFF -DQT_HOST_PATH=$HOST_DIR \
# -DCMAKE_STAGING_PREFIX=$ROOT_HOME -DCMAKE_INSTALL_PREFIX=/usr/local/qt6 \
# -DCMAKE_TOOLCHAIN_FILE=$ROOT_HOME/toolchain64.cmake \
# -DQT_QMAKE_TARGET_MKSPEC=devices/linux-rasp-pi4-aarch64 \
# -DQT_FEATURE_xcb=ON -DFEATURE_xcb_xlib=ON -DQT_FEATURE_xlib=ON

    # rm -rf $WORK_HOME/qtbase-everywhere-src-6.8.3
    mkdir -p $WORK_HOME/qtbase-everywhere-src-6.8.3
    cd $WORK_HOME/qtbase-everywhere-src-6.8.3  && \
    cmake $QT_SRC/qtbase-everywhere-src-6.8.3 -GNinja \
    -DCMAKE_BUILD_TYPE=Release \
    -DINPUT_opengl=es2 \
    -DQT_BUILD_EXAMPLES=OFF \
    -DQT_BUILD_TESTS=OFF \
    -DQT_HOST_PATH=$HOST_DIR \
    -DCMAKE_STAGING_PREFIX=$PI_DIR \
    -DCMAKE_INSTALL_PREFIX=/usr/local/qt6 \
    -DCMAKE_TOOLCHAIN_FILE=$ROOT_HOME/toolchain64.cmake \
    -DGCC_VERSION=12 -DFEATURE_xcb_xlib=ON \
    -DQT_FEATURE_xlib=ON && \
    ninja && \
    ninja install; \


# cmake -G Ninja \
# -DCMAKE_BUILD_TYPE=Release \
# -DCMAKE_INSTALL_PREFIX=$PI_DIR \
# -DQT_FEATURE_opengles2=ON \
# -DQT_FEATURE_opengles3=ON \
# -DQT_FEATURE_kms=ON \
# -DQT_FEATURE_xcb=ON \
# -DQT_BUILD_TESTS=OFF \
# -DQT_FEATURE_xcb=ON \
# -DQT_FEATURE_vulkan=ON \
# -DQT_HOST_PATH=$HOST_DIR \
# -DQT_AVOID_CMAKE_ARCHIVING_API=ON  \
# -DCMAKE_TOOLCHAIN_FILE=$ROOT_HOME/toolchain64.cmake \
# -DQT_QMAKE_TARGET_MKSPEC=devices/linux-rasp-pi4-aarch64 \
# $QT_SRC/qtbase-everywhere-src-6.8.3/

    # cmake --build . --parallel 8
    # cmake --install .

}

function build_qt6_2() {
    rm -rf $WORK_HOME/$1
    mkdir $WORK_HOME/$1
    cd $WORK_HOME/$1

    $PI_DIR/bin/qt-configure-module $ROOT_HOME/qt5/$1 
    cmake --build . --parallel 8
    cmake --install .
}


function build_qt6_audio() {
    rm -rf $WORK_HOME/$1
    mkdir -p $WORK_HOME/$1
    cd $WORK_HOME/$1 
    $PI_DIR/bin/qt-configure-module $ROOT_HOME/qt5/$1
    cmake --build . --parallel 8 
    cmake --install .
}

# build_qt6

# build_qt6_2 qtshadertools-everywhere-src-6.8.3

# build_qt6_2 qtwayland-everywhere-src-6.8.3

# build_qt6_2 qtserialport-everywhere-src-6.8.3

# build_qt6_2 qtsvg-everywhere-src-6.8.3

# build_qt6_2 qtwebsockets-everywhere-src-6.8.3

# build_qt6_2 qtdeclarative-everywhere-src-6.8.3

# build_qt6_2 qtvirtualkeyboard-everywhere-src-6.8.3

# build_qt6_2 qtcharts-everywhere-src-6.8.3

build_qt6_2 qtconnectivity-everywhere-src-6.8.3
# build_qt6_audio qtmultimedia-everywhere-src-6.8.3

echo "done .."
