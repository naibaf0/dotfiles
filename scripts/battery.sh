#!/usr/bin/env bash

source `realpath "$0" | xargs dirname`/colors.sh

bat_number="${BLOCK_INSTANCE:-0}"

acpi=$(acpi -b | grep 'Battery '"$bat_number" | sed 's/\ //g')
status=$(echo "$acpi" | cut -d, -f1 | cut -d: -f2)
percent=$(echo "$acpi" | cut -d, -f2 | sed 's/\%//g')
time=$(echo "$acpi" | cut -d, -f3 | cut -d: --fields=1,2)

if [ "$status" == "Full" ]; then
  full_text=' '
  short_text=' '
else
  if [ "$status" == "Discharging" ] || [ "$status" == "Charging" ]; then
    if [ "$percent" -gt "90" ]; then
      label=' '
    elif [ "$percent" -gt "60" ]; then
      label=' '
    elif [ "$percent" -gt "40" ]; then
      label=' '
    elif [ "$percent" -gt "10" ]; then
      label=' '
    else
      label=' '
    fi
  fi
  if [ "$status" == "Discharging" ]; then
    full_text="$label"'('"$time"')'
    short_text='- '"$percent"'%'
  elif [ "$status" == "Charging" ]; then
    full_text="$label"'('"$time"')'
    short_text=' '"$percent"'%'
  else
    full_text='Error parsing battery from acpi'
    short_text=''
  fi
fi

echo $full_text
echo $short_text

# consider color and urgent flag only on discharge
if [ "$status" == "Discharging" ] && [ "$percent" -gt "90" ]; then
  echo $color2 #color2/base0B
elif [ "$status" == "Discharging" ] && [ "$percent" -gt "60" ]; then
  echo $color3 #color3/base0A
elif [ "$status" == "Discharging" ] && [ "$percent" -gt "40" ]; then
  echo $color16 #color16/base09
elif [ "$status" == "Discharging" ] && [ "$percent" -gt "10" ]; then
  echo $color1 #color1/base08
elif [ "$status" == "Discharging" ]; then
  exit 33
fi

exit 0

