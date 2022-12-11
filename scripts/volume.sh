#!/bin/zsh

# Configure Volume with notification

if [ "$1" = "vol" ]; then
    if [ "$2" = "mute"  ]; then
        wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
    elif [ "$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $3}')" != "[MUTED]" ]; then
        if [ "$2" = "up" ]; then
            wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
        elif [ "$2" = "down" ]; then
          wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
        fi
    fi

    VOL=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2*100}')
    VOL_STRING="${VOL}%"
    if [ "$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $3}')" = "[MUTED]" ]; then
        if [ "$2" = "mute"  ]; then
            notify-send --category=volume --hint=string:synchronous:volume -i audio-volume-muted "MUTED" ""
        else
            notify-send --category=volume --hint=int:value:$VOL --hint=string:synchronous:volume -i audio-volume-muted "MUTED" ""
        fi
    elif [[ $VOL < 34 ]]; then
        notify-send --category=volume --hint=int:transient:1 --hint=int:value:$VOL --hint=string:synchronous:volume -i audio-volume-low "${VOL_STRING}" ""
    elif [[ $VOL < 67 ]]; then
        notify-send --category=volume --hint=int:transient:1 --hint=int:value:$VOL --hint=string:synchronous:volume -i audio-volume-medium "${VOL_STRING}" ""
    else
        notify-send --category=volume --hint=int:transient:1 --hint=int:value:$VOL --hint=string:synchronous:volume -i audio-volume-high "${VOL_STRING}" ""
    fi

elif [ "$1" = "mic" ]; then
    wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle

    MIC_VOL=$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | awk '{print $2*100}')
    if [ "$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | awk '{print $3}')" = "[MUTED]" ]; then
        notify-send --category=volume --hint=string:synchronous:volume -i mic-off "MIC OFF" ""
    else
        notify-send --category=volume --hint=int:transient:1 --hint=int:value:$MIC_VOL --hint=string:synchronous:volume -i mic-on "MIC ON" ""
    fi
fi

