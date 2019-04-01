#!/bin/sh

#Check if the log file alread exists
if [ ! -e network.log ]; then
  echo "EPOCH_TIME,LAN,WAN" > network.log
fi

while true
do
  DATE=`date +'%s'`
  #Check if the router is up 
  if ping -q -c 1 -w 1 192.168.0.1 >/dev/null; then
    ROUTER=",1" 
  else
    ROUTER=",0"
  fi

  #Check if bbc.co.uk is up
  if ping -q -c 1 -w 1 bbc.co.uk >/dev/null; then
    SITE=",1"
  else
    SITE=",0"
  fi
  echo "$DATE$ROUTER$SITE" >> network.log
  sleep 3 
done
