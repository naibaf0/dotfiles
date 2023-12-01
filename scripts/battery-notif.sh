#!/usr/bin/env bash

PERC_LIMIT=10

BATTERY="BATT"
BATTERY_PATH="/sys/class/power_supply/$BATTERY"

while true; do
    FULL=$(/usr/bin/cat $BATTERY_PATH/charge_full)
    REM=$(/usr/bin/cat $BATTERY_PATH/charge_now)
    STAT=$(/usr/bin/cat $BATTERY_PATH/status)

    PERC=$((($REM * 100) / $FULL))

    # If not charging and battery is below percentage limit defined above, then send notification
    if [ $STAT = "Discharging" ] && [ $PERC -le $PERC_LIMIT ]; then
        notify-send -i battery-empty -u critical -a "system" "Low battery!" "Plug in a charger ASAP!"
        sleep 1200
    else
        sleep 120
    fi
done
