#!/bin/bash

while true ; do
    kill $(pgrep -f 'python error.py')
    if ifconfig wlan0 | grep -q "inet addr:" ; then
        sleep 60
    else
        echo "Network connection down! Attempting reconnection."
        python /home/pi/2048-Pi-Display/error.py &
        ifup --force wlan0
        sleep 10
    fi
done