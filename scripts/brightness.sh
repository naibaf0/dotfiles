#!/bin/sh

# Increase/decrease backlight with notification

if [ "$1" == "up" ]; then
 	xbacklight -inc 10
else
	if [ "$1" == "down" ]; then
 		xbacklight -dec 10
	fi
fi
brightnessLevel=$(cat /sys/class/backlight/intel_backlight/actual_brightness)
maxBrightness=$(($(cat /sys/class/backlight/intel_backlight/max_brightness)/10))

brightness=`echo $brightnessLevel / $maxBrightness | bc`

color1="#F7E599'>"
color2="#F7E081'>"
color3="#F7DB68'>"
color4="#F5CF38'>"
color5="#F5CC27'>"
color6="#F7CA16'>"
color7="#FACB0F'>"
color8="#F7C600'>"
col="<span color='"
end="</span>"

case $brightness in
        1)      notify-send "Brightness:" "$col$color1■$end▢▢▢▢▢▢▢▢▢";;
        2)      notify-send "Brightness:" "$col$color1■■$end▢▢▢▢▢▢▢▢";;
        3)      notify-send "Brightness:" "$col$color2■■■$end▢▢▢▢▢▢▢";;
        4)      notify-send "Brightness:" "$col$color2■■■■$end▢▢▢▢▢▢";;
        5)      notify-send "Brightness:" "$col$color3■■■■■$end▢▢▢▢▢";;
        6)      notify-send "Brightness:" "$col$color3■■■■■■$end▢▢▢▢";;
        7)      notify-send "Brightness:" "$col$color4■■■■■■■$end▢▢▢";;
        8)      notify-send "Brightness:" "$col$color4■■■■■■■■$end▢▢";;
        9)      notify-send "Brightness:" "$col$color5■■■■■■■■■$end▢";;
       10)      notify-send "Brightness:" "$col$color5■■■■■■■■■■$end";;
esac
