#! /bin/bash

if [ -z "$1" ]; then
  echo "tordl.sh install"
  echo "tordl.sh <URL>"
  exit
fi

if [ $1 == 'install' ]; then
  apt install youtube-dl
  exit
fi

youtube-dl --proxy socks5://127.0.0.1:9050 $1
