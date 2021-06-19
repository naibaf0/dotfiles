#!/bin/zsh

# Configure Volume with notification

if [ "$1" = "up" ]; then
 	pamixer -i 5
  notify-send --hint=int:transient:1 --hint=int:value:${$(pamixer --get-volume)%.*} --hint=string:synchronous:volume -i audio-volume-high "Volume up 5 %" ""
elif [ "$1" = "down" ]; then
  pamixer -d 5
  notify-send --hint=int:transient:1 --hint=int:value:${$(pamixer --get-volume)%.*} --hint=string:synchronous:volume -i audio-volume-low "Volume down 5 %" ""
elif [ "$1" = "mute"  ]; then
 	  pamixer -t
  if [ $(pamixer --get-mute) = true ]; then
    notify-send --hint=string:synchronous:volume -i audio-volume-muted "Muted" ""
  else
    notify-send --hint=string:synchronous:volume -i audio-volume-medium "Unmuted" ""
	fi
fi

