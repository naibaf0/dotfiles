#!/bin/bash

MENU="󰍃 Logout
󰒲 Suspend
󰜉 Reboot
󰐥 Shutdown"

CHOICE=$(echo "$MENU" | wofi -i --dmenu -L 5 -W 15%)

case $CHOICE in
  "󰍃 Logout")
    hyperctl dispatch exit;;
  "󰒲 Suspend")
    systemctl suspend;;
  " Reboot")
    systemctl reboot;;
  "󰐥 Shutdown")
    systemctl poweroff -i;;
esac
