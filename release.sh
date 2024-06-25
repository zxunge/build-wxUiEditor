#!/usr/bin/bash

set -eux

BUILD_DATE=20240625
HOME=$(cygpath -m /home)
NAME=wxUiEditor-build${BUILD_DATE}

# Compress results
7zr a -mx9 -mqs=on -mmt=on /home/${NAME}.7z /home/wxUiEditor

# Upload binaries
if [[ -v GITHUB_WORKFLOW ]]; then
  echo "OUTPUT_BINARY=${HOME}/${NAME}.7z" >> $GITHUB_OUTPUT
  echo "RELEASE_NAME=${NAME}" >> $GITHUB_OUTPUT
  echo "BUILD_DATE=${BUILD_DATE}" >> $GITHUB_OUTPUT
  echo "OUTPUT_NAME=${NAME}.7z" >> $GITHUB_OUTPUT
fi
