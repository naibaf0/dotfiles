#!/bin/bash
IMAGE=/tmp/screen_locked.png

# take a screenshot and blur the image
grim $IMAGE
convert -blur 10x10 $IMAGE $IMAGE

killall -SIGUSR1 dunst # pause notification demon
physlock -l # prevent tty switching

# lock screen with swaylock
# -n --no-fork
# -e --no-empty-passwords
# -f --failed-attempts
swaylock -n -e -i $IMAGE 

physlock -L # reenable tty switching
killall -SIGUSR2 dunst # resume notification demon
