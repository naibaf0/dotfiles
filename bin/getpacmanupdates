#!/bin/sh

# Get number of available updates for pacman

UPDATE_COUNT=$(checkupdates | wc -l)
if [ "$UPDATE_COUNT" -gt 0 ]; then
  upd=' '$UPDATE_COUNT
  echo $upd
else
  echo ' '
fi
