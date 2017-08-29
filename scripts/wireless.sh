#!/usr/bin/env bash

INTERFACE="${BLOCK_INSTANCE:-wlan0}"

[[ ! -d /sys/class/net/${INTERFACE}/wireless ]] ||
    [[ "$(cat /sys/class/net/$INTERFACE/operstate)" = 'down' ]] && exit

ESSID=$(iwgetid -r)
QUALITY=$(grep $INTERFACE /proc/net/wireless | awk '{ print int($3 * 100 / 70) }')

full_text="$ESSID ($QUALITY%)"
short_text="$ESSID"

echo $full_text
echo $short_text

# color
if [[ $QUALITY -lt 80 ]]; then
    echo "#FAC863" #color03/base0A
elif [[ $QUALITY -lt 60 ]]; then
    echo "#F99157" #color16/base09
elif [[ $QUALITY -lt 40 ]]; then
    echo "#EC5f67" #color01/base08
fi
