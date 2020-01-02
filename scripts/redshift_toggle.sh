#!/bin/bash

RSFILE=${RSFILE:-/tmp/${USER}/rsFile}

if [ -e $RSFILE ]; then
    redshift -c $HOME/.config/redshift/redshift.conf &
    notify-send "Redshift" "<i>enabled</i>" -i redshift-status-on
    rm $RSFILE
else
    echo $ "dummytext" >> $RSFILE
    pgrep -f "redshift -c $HOME/.config/redshift/redshift.conf" | xargs kill
    notify-send "Redshift" "<i>disabled</i>" -i redshift-status-off
fi