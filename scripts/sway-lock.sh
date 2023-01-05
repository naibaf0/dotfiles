#!/bin/bash

physlock -l #prevent tty switching
swaylock -e --grace 30 --screenshots --clock --indicator --effect-blur 5x5
physlock -L # reenable tty switching
