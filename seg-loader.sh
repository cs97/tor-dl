#!/bin/bash

if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ] || [ -z "$4" ]; then
  echo "seg-loader.sh <output> <segID> <range> <https://>"
  exit
fi

mkdir tmp
rm tmp/*

segID=$2
range=$3
address="$4"


for ((i=1;i<=range;i++))
do
	s=$(echo $address | sed s/$segID+"1"/$segID$i/g)
	echo "download $i of $range"
	wget -qO - ""$s"" >> tmp/part$i.mpg
done


for ((i=1;i<=range;i++))
do
	cat tmp/part$i.mpg >> $1.mpg
done
