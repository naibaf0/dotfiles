#!/bin/sh

# Display the number of available updates in pacman and the AUR

pac=$(checkupdates | wc -l)
aur=$(checkupdates-aur | wc -l)

updates=$((pac + aur))
if [ "$updates" -gt 0 ]; then
  echo " ($pac;$aur)"
else
  echo ""
fi
