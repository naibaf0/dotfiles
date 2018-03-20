#!/bin/bash
IMAGE=/tmp/screen_locked.png

xset b off

# take a screenshot and blur the image
scrot $IMAGE
convert -blur 10x10 $IMAGE $IMAGE

killall -SIGUSR1 dunst # pause notification demon
physlock -l # prevent tty switching

# lock screen with i3lock
# -n --no-fork
# -e --no-empty-passwords
# -f --failed-attempts
swaylock -n -e -f -i $IMAGE 

physlock -L # reenable tty switching
killall -SIGUSR2 dunst # resume notification demon

xset b on
