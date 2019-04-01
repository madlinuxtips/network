#!/bin/sh

#Check if the log file alread exists
if [ ! -e data.csv ]; then
  echo "EPOCH_TIME,LAN" > data.csv
fi
if [ ! -e data1.csv ]; then
  echo "EPOCH_TIME,WAN" > data1.csv
fi

while true
do
  DATE=`date +'%s'`
  #Check if the router is up 
  if ping -q -c 1 -w 1 192.168.0.1 >/dev/null; then
    LAN=",1" 
  else
    LAN=",2"
  fi

  #Check if bbc.co.uk is up
  if ping -q -c 1 -w 1 bbc.co.uk >/dev/null; then
    WAN=",1"
  else
    WAN=",2"
  fi
  echo "$DATE$LAN" >> data.csv
  echo "$DATE$WAN" >> data1.csv
  sleep 3 
done
