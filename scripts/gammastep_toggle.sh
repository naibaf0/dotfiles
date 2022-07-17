#!/bin/bash

RSFILE=${RSFILE:-/tmp/${USER}/rsFile}

if [ -e $RSFILE ]; then
    gammastep -c $HOME/.config/gammastep/config.ini &
    notify-send "Gammastep" "<i>enabled</i>" -i /usr/share/icons/hicolor/scalable/apps/redshift-status-on.svg
    rm $RSFILE
else
    echo $ "dummytext" >> $RSFILE
    pgrep -f "gammastep -c $HOME/.config/gammastep/config.ini" | xargs kill
    notify-send "Gammastep" "<i>disabled</i>" -i /usr/share/icons/hicolor/scalable/apps/redshift-status-off.svg
fi
