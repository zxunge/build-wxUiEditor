#!/usr/bin/bash

set -eux

mkdir -p /d/temp
cd /d/temp

wget -q https://github.com/Kitware/CMake/releases/download/v3.28.6/cmake-3.28.6-windows-i386.zip
wget -q https://github.com/ninja-build/ninja/releases/download/v1.12.1/ninja-win.zip
unzip -q cmake-3.28.6-windows-i386.zip
unzip -q ninja-win.zip -o ./ninja