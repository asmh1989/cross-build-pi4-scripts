#! /bin/bash
ROOT_HOME=$HOME/raspi

QT_SRC=$ROOT_HOME/qt5
version=$(cd $QT_SRC && git branch --show-current)
HOST_DIR=$ROOT_HOME/qt-host/$version
PI_DIR=$ROOT_HOME/qt-pi-64/$version
WORK_HOME=$ROOT_HOME/build/pi-64-$version
# rm -rf $WORK_HOME
mkdir -p $WORK_HOME
mkdir -p $PI_DIR
cd $WORK_HOME

function build_qt6() {
    # 6.6 编译配置
    $QT_SRC/qtbase/configure -release -opengl es2 -nomake examples -nomake tests -qt-host-path $HOST_DIR -extprefix $PI_DIR -prefix /usr/local/qt6 -device linux-rasp-pi4-aarch64 -device-option CROSS_COMPILE=aarch64-linux-gnu- -- -DCMAKE_TOOLCHAIN_FILE=$ROOT_HOME/toolchain64.cmake -DQT_FEATURE_xcb=ON -DFEATURE_xcb_xlib=ON -DQT_FEATURE_xlib=ON -DFEATURE_dbus=OFF
    
    # 6.8 编译配置
    #$QT_SRC/qtbase/configure -release -eglfs -opengl es2 -nomake examples -nomake tests -qt-host-path $HOST_DIR -extprefix $PI_DIR -prefix /usr/local/qt6 -device linux-rasp-pi4-aarch64 -device-option CROSS_COMPILE=aarch64-linux-gnu- -- -DCMAKE_TOOLCHAIN_FILE=$ROOT_HOME/toolchain64.cmake -DQT_FEATURE_xcb=ON -DFEATURE_xcb_xlib=ON -DQT_FEATURE_xlib=ON -DFEATURE_dbus=OFF
    # $QT_SRC/qtbase/configure -release -opengl es2 -nomake examples -nomake tests -optimize-size -no-feature-linuxfb -no-feature-testlib -no-feature-ipv6ifname -no-feature-clipboard -no-feature-private_tests -no-feature-androiddeployqt -no-feature-macdeployqt -no-feature-windeployqt  -disable-deprecated-up-to 0x070000 -qt-host-path $HOST_DIR -extprefix $PI_DIR -prefix /usr/local/qt6 -device linux-rasp-pi4-aarch64 -device-option CROSS_COMPILE=aarch64-linux-gnu- -- -DCMAKE_TOOLCHAIN_FILE=$ROOT_HOME/toolchain64.cmake -DQT_FEATURE_xcb=ON -DFEATURE_xcb_xlib=ON -DQT_FEATURE_xlib=ON -DFEATURE_dbus=OFF
    # $QT_SRC/qtbase/configure  -extprefix $PI_DIR  -release -opengl es2 -nomake examples -nomake tests -optimize-size -static -ltcg -reduce-exports -gc-binaries  -feature-eglfs -feature-egl -feature-opengl -feature-opengles2 -no-feature-wayland -no-feature-linuxfb -no-feature-testlib -no-feature-ipv6ifname -no-feature-clipboard -no-feature-private_tests -no-feature-androiddeployqt -no-feature-macdeployqt -no-feature-windeployqt  -disable-deprecated-up-to 0x070000 -qpa eglfs -qt-host-path $HOST_DIR -prefix /usr/local/qt6 -device linux-rasp-pi4-aarch64 -device-option CROSS_COMPILE=aarch64-linux-gnu- -- -DCMAKE_TOOLCHAIN_FILE=$ROOT_HOME/toolchain64.cmake -DQT_FEATURE_xcb=ON -DFEATURE_xcb_xlib=ON -DQT_FEATURE_xlib=ON -DFEATURE_dbus=OFF
    cmake --build . --parallel 8
    cmake --install .
}

function build_qt6_2() {
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
    $PI_DIR/bin/qt-cmake $ROOT_HOME/qt5/qtmultimedia -DQT_FEATURE_alsa=ON -DQT_FEATURE_PulseAudio=OFF
    cmake --build . --parallel 8 
    cmake --install .
}

# build_qt6

# build_qt6_2 qtshadertools

# build_qt6_2 qtdeclarative

# build_qt6_2 qtserialport

# build_qt6_2 qtsvg

# build_qt6_2 qtvirtualkeyboard

# build_qt6_2 qtcharts

# build_qt6_2 qtwebsockets

build_qt6_audio qtmultimedia
echo "done .."
