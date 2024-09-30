#!/bin/bash

# Set the flag file path as an environment variable or command-line argument
FLAG_FILE=~/.config/polybar/flag.txt

# Check if the flag file exists and read its contents
mode=$(cat "$FLAG_FILE" 2>/dev/null)

# Print out the current mode
echo "Current mode: $mode"

case $mode in
  "on")
    # Switch back to main bar, update gap, and remove polybar
    echo "off" > $FLAG_FILE
    i3-msg "gaps top all set 0" > /dev/null
    polybar-msg cmd quit
    ;;
  "off")
    # Switch to polybar (assuming it's the top one)
    echo "on" > $FLAG_FILE
    i3-msg "gaps top all set 30" > /dev/null
    if ! pgrep -x polybar > /dev/null
    then
        exec ~/.config/polybar/polybar.sh > /dev/null
    fi
    ;;
esac

exit 0