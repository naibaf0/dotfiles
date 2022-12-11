#!/bin/zsh

# Configure Volume with notification

if [ "$1" = "vol" ]; then
    if [ "$2" = "up" ]; then
        wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
    elif [ "$2" = "down" ]; then
      wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
    elif [ "$2" = "mute"  ]; then
        wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
    fi

    VOL=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2*100}')
    print $VOL
    if [ "$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $3}')" = "[MUTED]" ]; then
        notify-send --hint=string:synchronous:volume -i audio-volume-muted "Muted" ""
    elif [[ $VOL < 34 ]]; then
        notify-send --hint=int:transient:1 --hint=int:value:$VOL --hint=string:synchronous:volume -i audio-volume-low "${VOL}%" ""
    elif [[ $VOL < 67 ]]; then
        notify-send --hint=int:transient:1 --hint=int:value:$VOL --hint=string:synchronous:volume -i audio-volume-medium "${VOL}%" ""
    else
        notify-send --hint=int:transient:1 --hint=int:value:$VOL --hint=string:synchronous:volume -i audio-volume-high "${VOL}%" ""
    fi

elif [ "$1" = "mic" ]; then
        wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
fi

