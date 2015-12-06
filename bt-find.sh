#!/bin/bash

MAC="xx:xx:xx:xx:xx:xx" # mac address of bluetooth device

while true; do
	rfcomm connect 0 $MAC 10 2> /dev/null &

	while true; do
	    hcitool rssi $MAC 2> /dev/null
	    [ $? -lt 1 ] && break
	    sleep 0.1
	done
	sleep 1
done
