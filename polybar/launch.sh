#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

source "${HOME}/.cache/wal/colors.sh"
background=$color0
background_alt=$color3
foreground=$color15
foreground_alt=$color2
highlight=$color4

polybar main &

connected_dp=$(cat /sys/class/drm/card0/card0-DP-2/status)
if [ "$connected_dp" == "connected" ]; then
    polybar second &
fi
