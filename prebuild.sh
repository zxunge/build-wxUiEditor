#!/usr/bin/bash

set -eux

BUILD_DATE=20240625
HOME=$(cygpath -m /home)
NAME=wxUiEditor-build${BUILD_DATE}

cd /home

# Toolchain used to build wxUiEditor
#wget -q https://github.com/brechtsanders/winlibs_mingw/releases/download/14.1.0posix-18.1.7-12.0.0-ucrt-r2/winlibs-i686-posix-dwarf-gcc-14.1.0-mingw-w64ucrt-12.0.0-r2.7z
#7z x winlibs-i686-posix-dwarf-gcc-14.1.0-mingw-w64ucrt-12.0.0-r2.7z -r -o/home

# Funny tricks.
rm -rf "C:/Program Files/Microsoft Visual Studio/2022/Enterprise/VC/Tools/MSVC/14.40.33807/bin/Hostx64"
mv -rf "C:/Program Files/Microsoft Visual Studio/2022/Enterprise/VC/Tools/MSVC/14.40.33807/bin/Hostx86/x86" "C:/Program Files/Microsoft Visual Studio/2022/Enterprise/VC/Tools/MSVC/14.40.33807/bin/Hostx64/x64"

git clone https://github.com/KeyWorksRW/wxUiEditor.git

# Those build process should not be acted in msys2.
# Turned to pwsh.
