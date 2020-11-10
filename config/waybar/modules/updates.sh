#!/bin/sh

# Display the number of available updates in pacman and the AUR

pac=$(checkupdates | wc -l)
aur=$(paru -Pn --aur)

updates=$((pac+aur))
if [ "$updates" -gt 0 ]; then
  echo "$updates "
else
  echo ""
fi
