#!/usr/bin/env sh

# Terminate already running instances of the bar
killall -q lemonbuddy

# Wait for the processes to shut down
while pgrep -x lemonbuddy >/dev/null; do sleep 1; done


# Launch the bar
lemonbuddy main -q &

echo "Launched the main bar ..."
