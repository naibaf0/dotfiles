#!/usr/bin/env bash

bat_number="${BLOCK_INSTANCE:-0}"

acpi=`acpi -b | grep 'Battery '"$bat_number" | sed 's/\ //g'`
status=`echo $acpi | cut -d, -f1 | cut -d: -f2`
percent=`echo $acpi | cut -d, -f2 | sed 's/\%//g'`
time=`echo $acpi | cut -d, -f3 | cut -d: --fields=1,2`

if [ "$status" == "Discharging" ]; then
  text='-'"$percent"'% ('"$time"')'
elif [ "$status" == "Charging" ]; then
  text=' '"$percent"'% ('"$time"')'
elif [ "$status" == "Full" ]; then
  text=' '"$percent"'%'
else
  text='Error parsing battery from acpi'
fi

echo $text

# consider color and urgent flag only on discharge
if [ "$status" == "Discharging" ] && [ "$percent" -lt "15" ]; then
  exit 33
fi

exit 0

