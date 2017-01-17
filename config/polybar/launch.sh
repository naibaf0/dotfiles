#!/usr/bin/env sh

# Terminate already running instances of the bar
killall -q polybar

# Wait for the processes to shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

MONITORS=$(xrandr -q | grep "*" | wc -l)

#if [ "$MONITORS" -eq 2 ]; then
  #polybar main -q &
  #polybar right -q &
  #echo "Launched the main bar and the right bar"
#elif [ "$MONITORS" -eq 1 ]; then
  polybar main -q &
  echo "Launched the main bar"
#fi

