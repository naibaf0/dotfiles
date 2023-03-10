#!/usr/bin/env bash

physlock -l #prevent tty switching

case "$1" in
    soon)
        swaylock -e --grace 30 --screenshots --clock --indicator --effect-blur 5x5
        ;;
    *)
        swaylock -e --screenshots --clock --indicator --effect-blur 5x5
esac

physlock -L # reenable tty switching
