#!/usr/bin/env bash

case "$1" in
    suspend)
        systemctl suspend
        ;;
    reboot)
        systemctl reboot
        ;;
    shutdown)
        systemctl poweroff
        ;;
    *)
        echo "Usage: $0 [suspend|reboot|shutdown]"
        exit 2
esac

exit 0
