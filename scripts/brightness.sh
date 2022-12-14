#!/bin/zsh

# Increase/decrease backlight with notification

if [ "$1" = "up" ]; then
 	light -A 10
  notify-send --category=brightness --hint=int:transient:1 --hint=int:value:${$(light -G)%.*} --hint=string:synchronous:brightness -i high-brightness "Brightness up 10 %" ""
else
	if [ "$1" = "down" ]; then
 	  light -U 10
    notify-send --category=brightness --hint=int:transient:1 --hint=int:value:${$(light -G)%.*} --hint=string:synchronous:brightness -i low-brightness "Brightness down 10 %" ""
	fi
fi
