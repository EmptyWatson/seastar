#!/bin/bash
mode=$1
source /opt/rh/devtoolset-11/enable
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig
export BOOST_ROOT=/opt/boost

if [[ "${mode}" == "release" ]]; then
    echo "use release mode to build"
    #./configure.py --mode=release
    ./configure.py --disable-hwloc --cflags="-DSEASTAR_DEFAULT_ALLOCATOR -fvisibility=default" --mode=release
    ninja -C build/release -j4
    ninja install -C build/release
else
    echo "use debug mode to build"
    #./configure.py --mode=debug 
    ./configure.py --disable-hwloc --cflags="-DSEASTAR_DEFAULT_ALLOCATOR -fvisibility=default" --mode=debug 
    ninja -C build/debug -j4
    ninja install -C build/debug
fi
