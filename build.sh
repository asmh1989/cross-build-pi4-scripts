../qt5/qtbase/configure -release -opengl es2 -nomake examples -nomake tests -qt-host-path $HOME/raspi/qt-host -extprefix $HOME/raspi/qt-raspi -prefix /usr/local/qt6 -device linux-rasp-pi4-v3d-g++ CROSS_COMPILE=arm-linux-gnueabihf- -- -DCMAKE_TOOLCHAIN_FILE=$HOME/raspi/toolchain.cmake -DQT_FEATURE_xcb=ON -DFEATURE_xcb_xlib=ON -DQT_FEATURE_xlib=ON

# cmake ../qt5/qtbase -GNinja -DCMAKE_BUILD_TYPE=Release -DINPUT_opengl=es2 -DQT_BUILD_EXAMPLES=OFF -DQT_BUILD_TESTS=OFF -DQT_HOST_PATH=$HOME/raspi/qt-host -DCMAKE_STAGING_PREFIX=$HOME/raspi/qt-raspi -DCMAKE_INSTALL_PREFIX=/usr/local/qt6 -DCMAKE_TOOLCHAIN_FILE=$HOME/raspi/toolchain.cmake -DQT_QMAKE_TARGET_MKSPEC=devices/linux-rasp-pi4-v3d-g++ -DQT_FEATURE_xcb=ON -DFEATURE_xcb_xlib=ON -DQT_FEATURE_xlib=ON