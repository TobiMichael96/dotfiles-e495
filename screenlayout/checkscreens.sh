#!/usr/bin/env bash
connected=$(cat /sys/class/drm/card0/card0-HDMI-A-1/status)
if [ "$connected" == "connected" ]; then
    	sh ~/.screenlayout/withTV.sh
    	sleep 1
    	bspc monitor LVDS1 -d 1 2 3 4 5 6 7 8
    	bspc monitor HDMI1 -d 9 10
    	notify-send "Screen" "Second screen added..."
else
    	sh ~/.screenlayout/withoutTV.sh
    	sleep 1
    	bspc monitor LVDS1 -d 1 2 3 4 5 6 7 8 9 10
#    	bspc monitor HDMI1 -d 9 10
	notify-send "Screen" "Second screen removed..."
fi

sh ~/dotfiles/scripts/hdmi_sound_toggle.sh
wal -i ~/dotfiles/background
