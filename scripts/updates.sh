#!/bin/sh

# Display the number of available updates in pacman and the AUR

source `dirname $0`/colors.sh

if [ $BLOCK_BUTTON = "3" ]; then
  $TERMINAL --name="update_installer" -e "trizen -Syu"
fi

updates=$(yay -Pn)

if [ "$updates" -gt 0 ]; then
  echo " <b>$updates</b>"
  echo " <b>$updates</b>"
  echo $color1 #red
else
  echo ""
fi
