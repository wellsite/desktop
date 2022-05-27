#!/bin/sh
set -e
WORKING_DIR=`pwd`
THIS_PATH=`readlink -f $0`
cd `dirname ${THIS_PATH}`
FULL_PATH=`pwd`
cd ${WORKING_DIR}
cat <<EOS > Wellsite.desktop
[Desktop Entry]
Name=Wellsite
Comment=Wellsite Desktop application for Linux
Exec="${FULL_PATH}/wellsite-desktop"
Terminal=false
Type=Application
Icon=${FULL_PATH}/app_icon.png
Categories=Network;InstantMessaging;
EOS
chmod +x Wellsite.desktop
