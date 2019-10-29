#!/bin/bash

i3lock_args=()
i3lock_args+=(-n -e -f)

image=$(mktemp --suffix=.png)
i3lock_args+=(-i "$image")
scrot -o "$image"

printf '%s\n' "${image}" | xargs -P 0 -I{} convert -blur 10x10 {} {}

killall -SIGUSR1 dunst # pause notification demon
physlock -l # prevent tty switching
i3lock "${i3lock_args[@]}"
physlock -L # reenable tty switching
killall -SIGUSR2 dunst # resume notification demon
rm "$image"

