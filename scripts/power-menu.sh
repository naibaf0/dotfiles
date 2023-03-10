#!/bin/bash

MENU="  Logout
鈴 Suspend
  Reboot
  Shutdown"

CHOICE=$(echo "$MENU" | wofi -i --dmenu -L 5 -W 15%)

case $CHOICE in
  "  Logout")
    swaymsg exit;;
  "鈴 Suspend")
    exec systemctl suspend;;
  "  Reboot")
    exec systemctl reboot;;
  "  Shutdown")
    exec systemctl poweroff -i;;
esac
