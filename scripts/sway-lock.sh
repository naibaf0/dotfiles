#!/usr/bin/env bash

# physlock -l #prevent tty switching

case "$1" in
    soon)
        swaylock -f -e --grace 30 --screenshots --clock --indicator --effect-blur 5x5
        ;;
    *)
        swaylock -f -e --screenshots --clock --indicator --effect-blur 5x5
esac

# physlock -L # reenable tty switching
