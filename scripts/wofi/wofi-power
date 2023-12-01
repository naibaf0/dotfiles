#!/bin/bash

MENU="img:/usr/share/icons/breeze-dark/actions/32/system-log-out.svg:text:Logout\nimg:/usr/share/icons/breeze-dark/actions/32/system-suspend.svg:text:Suspend\nimg:/usr/share/icons/breeze-dark/actions/32/system-reboot.svg:text:Reboot\nimg:/usr/share/icons/breeze-dark/actions/32/system-shutdown.svg:text:Shutdown:"

CHOICE=$(echo -e "$MENU" | wofi --dmenu -L 5 -W 15% --cache-file /dev/null | awk '{print tolower($1)}')

case $CHOICE in
  "logout")
    hyperctl dispatch exit 0;;
  "suspend")
    systemctl suspend;;
  "reboot")
    systemctl reboot;;
  "shutdown")
    systemctl poweroff -i;;
esac
