#!/bin/bash
pwd=`dirname $(readlink -f "$0")`

cd "$pwd"

echo "--------------------------------------------------------------"
echo "Setting PATH to $pwd:$PATH"
export PATH=$pwd:$PATH

echo "--------------------------------------------------------------"
echo "Setting HOME to $pwd"
export HOME=$pwd
export XDG_HOME_DIRS=$pwd
export XDG_CONFIG_HOME=$pwd

if [ ! -e ".ja2/ja2.json" ]; then
  mkdir -p .ja2
  cp defaults/ja2.json .ja2/ja2.json
fi

if [ ! -d "data" ];then
   zenity --error --width=400 --height=200 --text="Jagged Alliance 2 data possibly not correct, please copy into /dragonbox/appdata/ja2/ directory AND make sure it is data with lower case d" --timeout=10
   exit 1
fi

gl4es ./ja2 "$@"
