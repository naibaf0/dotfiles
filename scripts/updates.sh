#!/bin/sh

# Display the number of available updates in pacman and the AUR

source `dirname $0`/colors.sh

if [ $BLOCK_BUTTON = "3" ]; then
  $TERMINAL --name="update_installer" -e "trizen -Syu"
fi

pac=$(checkupdates | wc -l)
if ! aur=$(trizen -Su --aur --quiet | wc -l); then
  aur=0
fi

updates=$((pac + aur))
if [ "$updates" -gt 0 ]; then
  echo " <b>($pac;$aur)</b>"
  echo " <b>($pac;$aur)</b>"
  echo $color1 #red
else
  echo ""
fi
