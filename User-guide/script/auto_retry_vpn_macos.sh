#!/bin/bash
        CON="kaopiz-bamboo"
        STATUS=`scutil --nc list | grep Connected | grep $CON | cut -f2 -d " "`
        if [ -z "$STATUS" ]; then
                echo "Disconnected, trying to reconnect..."
                (sleep 1s && networksetup -connectpppoeservice $CON)
        else
                echo "Already connected ! ... `date`"
        fi