#!/usr/bin/bash

set -eux

BUILD_DATE=20240625
HOME=$(cygpath -m /home)
NAME=wxUiEditor-build${BUILD_DATE}

# Delete the existing mingw64 at C: to avoid conflicting
rm -rf /c/mingw64/bin

cd /home

# Toolchain used to build wxUiEditor
wget https://github.com/brechtsanders/winlibs_mingw/releases/download/14.1.0posix-18.1.7-12.0.0-ucrt-r2/winlibs-i686-posix-dwarf-gcc-14.1.0-mingw-w64ucrt-12.0.0-r2.7z
7z x winlibs-i686-posix-dwarf-gcc-14.1.0-mingw-w64ucrt-12.0.0-r2.7z -r -o/home
cp -rf ./mingw32/* /mingw32/

git clone https://github.com/KeyWorksRW/wxUiEditor.git
cd wxUiEditor/

# Build!
cmake -G "Ninja Multi-Config" . -B build
cmake --build build --config Release --target wxUiEditor

# Compress results
7zr a -mx9 -mqs=on -mmt=on /home/${NAME}.7z /home/wxUiEditor

# Upload binaries
if [[ -v GITHUB_WORKFLOW ]]; then
  echo "OUTPUT_BINARY=${HOME}/${NAME}.7z" >> $GITHUB_OUTPUT
  echo "RELEASE_NAME=${NAME}" >> $GITHUB_OUTPUT
  echo "BUILD_DATE=${BUILD_DATE}" >> $GITHUB_OUTPUT
  echo "OUTPUT_NAME=${NAME}.7z" >> $GITHUB_OUTPUT
fi
