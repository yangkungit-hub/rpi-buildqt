#!/bin/bash

RPIDEV_ROOT=~/raspi-qt-5.9
export RPIDEV_TOOLS=${RPIDEV_ROOT}/tools
export RPIDEV_SRC=${RPIDEV_ROOT}/src
export RPIDEV_BUILD=${RPIDEV_ROOT}/build
export RPIDEV_SYSROOT=${RPIDEV_ROOT}/sysroot

export RPIDEV_JOBS=$(grep -c "^processor" /proc/cpuinfo)

# device info
export RPIDEV_DEVICE_VERSION=pi3            # pi1 pi2 pi3 (only tested pi3)
export RPIDEV_DEVICE_ADDRESS=10.0.50.124    # ip of device
export RPIDEV_DEVICE_PORT=22                # ssh port
export RPIDEV_DEVICE_USER=pi                # username
export RPIDEV_DEVICE_PW=raspberry           # password

# qt configuration
export QT_BUILD_VERSION=5.9                 # 5.8 5.9
export QT_INSTALL_DIR=${RPIDEV_BUILD}/qt${QT_BUILD_VERSION}
export QT_INSTALL_DIR_HOST=${RPIDEV_BUILD}/qt${QT_BUILD_VERSION}-host
export QT_DEVICE_DIR=/usr/local/qt${QT_BUILD_VERSION}

if [ "$QT_BUILD_VERSION" == "5.8" ]; then
	export QT_BUILD_MODULES="qtdeclarative qtquickcontrols qtquickcontrols2 qtmultimedia"
else
	export QT_BUILD_MODULES="qtdeclarative qtquickcontrols qtquickcontrols2 qtmultimedia qtsvg qtxmlpatterns qtwebsockets qtserialport qtwebchannel qtwebengine"
fi

# configure piomxtextures
export RPI_SYSROOT=${RPIDEV_SYSROOT}
export COMPILER_PATH=${RPIDEV_TOOLS}/arm-bcm2708/arm-rpi-4.9.3-linux-gnueabihf/bin

# configure pkg config
export PKG_CONFIG_DIR=
export PKG_CONFIG_LIBDIR=${RPIDEV_SYSROOT}/usr/lib/pkgconfig:${RPIDEV_SYSROOT}/usr/share/pkgconfig:${RPIDEV_SYSROOT}/usr/lib/arm-linux-gnueabihf/pkgconfig
export PKG_CONFIG_SYSROOT_DIR=${RPIDEV_SYSROOT}
