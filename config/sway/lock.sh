#!/bin/bash

images=()
swaylock_args=()

swaylock_args+=(-e)

for output in $(swaymsg -t get_outputs | jq -r '.[] .name'); do
  image=$(mktemp --suffix=.png)
  images+=("$image")
  swaylock_args+=(-i "$output":"$image")
  grim -o "$output" "$image"
done

printf '%s\n' "${images[@]}" | xargs -P 0 -I{} convert -blur 0x8 {} {}

physlock -l #prevent tty switching
swaylock "${swaylock_args[@]}" -s center
physlock -L # reenable tty switching
rm "${images[@]}"
