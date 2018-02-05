#!/bin/bash

killall -SIGUSR1 dunst # pause notification demon
physlock -l # prevent tty switching

i3lock -n 

physlock -L # reenable tty switching
killall -SIGUSR2 dunst # resume notification demon

notify-send "Welcome back!" -i lock-insecure
