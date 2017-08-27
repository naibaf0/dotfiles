#!/usr/bin/env bash

INTERFACE="${BLOCK_INSTANCE:-wlan0}"

[[ ! -d /sys/class/net/${INTERFACE}/wireless ]] ||
    [[ "$(cat /sys/class/net/$INTERFACE/operstate)" = 'down' ]] && exit

ESSID=$(iwgetid -r)
QUALITY=$(grep $INTERFACE /proc/net/wireless | awk '{ print int($3 * 100 / 70) }')

echo $ESSID $QUALITY%
echo $ESSID $QUALITY%

# color
if [[ $QUALITY -ge 80 ]]; then
    echo "#00FF00"
elif [[ $QUALITY -lt 80 ]]; then
    echo "#FFF600"
elif [[ $QUALITY -lt 60 ]]; then
    echo "#FFAE00"
elif [[ $QUALITY -lt 40 ]]; then
    echo "#FF0000"
fi
