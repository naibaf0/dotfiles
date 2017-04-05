#!/bin/sh

# Display the number of available updates in pacman and the AUR

pacman=$(checkupdates | wc -l)
aur=$(checkupdates-aur | wc -l)

updates=$((pacman + aur))
if [ "$updates" -gt 0 ]; then
  echo "($pacman  $aur)"
fi
