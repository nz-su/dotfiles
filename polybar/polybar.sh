#!/usr/bin/env sh

# Terminate already running bar instances
polybar-msg cmd quit

# Launch polybar
polybar -r -q center 2>&1 | tee -a /tmp/center.log & disown
polybar -r -q right 2>&1 | tee -a /tmp/right.log & disown
polybar -r -q left 2>&1 | tee -a /tmp/left.log & disown


