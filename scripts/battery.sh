#!/usr/bin/env bash

#icons:           

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
  text=' '
else
  text='Error parsing battery from acpi'
fi

echo $text
echo $text

# consider color and urgent flag only on discharge
if [ "$status" == "Discharging" ] && [ "$percent" -lt "80" ]; then
  echo "#99C794" #color02/base0B
elif [ "$status" == "Discharging" ] && [ "$percent" -lt "60" ]; then
  echo "#FAC863" #color03/base0A
elif [ "$status" == "Discharging" ] && [ "$percent" -lt "40" ]; then
  echo "#F99157" #color16/base09
elif [ "$status" == "Discharging" ] && [ "$percent" -lt "20" ]; then
  echo "#EC5f67" #color01/base08
elif [ "$status" == "Discharging" ] && [ "$percent" -lt "10" ]; then
  exit 33
fi

exit 0

