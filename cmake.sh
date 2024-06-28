#!/usr/bin/bash

set -eux

mkdir -p /d/temp
cd /d/temp

wget https://github.com/Kitware/CMake/releases/download/v3.29.6/cmake-3.29.6-windows-i386.zip
unzip -q cmake-3.29.6-windows-i386.zip
