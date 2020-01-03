#!/bin/bash

CMPFILE=${CMPFILE:-/tmp/${USER}/cmpFile}

if [ -e $CMPFILE ]; then
    picom -b &
    sleep 1
    notify-send "picom" "<i>enabled</i> -i compton"
    rm $CMPFILE
else
    echo $ "dummytext" >> $CMPFILE
    pgrep -f "picom -b" | xargs kill
    sleep 1
    notify-send "picom" "<i>disabled</i> -i compton"
fi
