#!/bin/bash

MENU="󰍃 Logout
󰒲 Suspend
󰜉 Reboot
󰐥 Shutdown"

CHOICE=$(echo "$MENU" | wofi -i --dmenu -L 5 -W 15%)

case $CHOICE in
  "󰍃 Logout")
    swaymsg exit;;
  "󰒲  Suspend")
    exec systemctl suspend;;
  "  Reboot")
    exec systemctl reboot;;
  "󰐥 Shutdown")
    exec systemctl poweroff -i;;
esac
