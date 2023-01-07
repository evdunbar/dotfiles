#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
#killall -q polybar

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log /tmp/polybar3.log /tmp/polybar4.log /tmp/polybar5.log /tmp/polybar6.log
polybar i3 2>&1 | tee -a /tmp/polybar1.log & disown
polybar battery 2>&1 | tee -a /tmp/polybar2.log & disown
polybar date 2>&1 | tee -a /tmp/polybar3.log & disown
polybar network 2>&1 | tee -a /tmp/polybar4.log & disown
polybar pulseaudio 2>&1 | tee -a /tmp/polybar5.log & disown
polybar time 2>&1 | tee -a /tmp/polybar6.log & disown

echo "Bars launched..."
