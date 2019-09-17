#!/usr/bin/env bash

source `dirname $0`/colors.sh

INTERFACE="${BLOCK_INSTANCE:-wlan0}"

[[ ! -d /sys/class/net/${INTERFACE}/wireless ]] ||
    [[ "$(cat /sys/class/net/$INTERFACE/operstate)" = 'down' ]] && exit

ESSID=$(iwgetid -r)
QUALITY=$(grep $INTERFACE /proc/net/wireless | awk '{ print int($3 * 100 / 70) }')

full_text=" $ESSID ($QUALITY%)"
short_text=" $ESSID"

echo $full_text
echo $short_text

# color
if [[ $QUALITY -lt 80 ]]; then
    echo $color3 #color3/base0A
elif [[ $QUALITY -lt 60 ]]; then
    echo $color16 #color16/base09
elif [[ $QUALITY -lt 40 ]]; then
    echo $color1 #color1/base08
fi
