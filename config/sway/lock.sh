#!/bin/bash

physlock -l #prevent tty switching
swaylock -e --screenshots --clock --indicator --effect-blur 5x5
physlock -L # reenable tty switching
rm "${images[@]}"
