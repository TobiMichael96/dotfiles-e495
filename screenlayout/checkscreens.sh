#!/bin/bash
connected=$(cat /sys/class/drm/card0/card0-HDMI-A-1/status)
if [ "$connected" == "connected" ]; then
    sh /home/tobias/.screenlayout/withTV.sh
	#sed -i 's/HandleLidSwitch=.*/HandleLidSwitch=ignored/' /etc/systemd/logind.conf
    #sed -i 's/HandleLidSwitchExternalPower=.*/HandleLidSwitchExternalPower=ignored/' /etc/systemd/logind.conf
	bspc monitor eDP -d 1 2 3 4 5 6 7 8 9 10 11 12
	bspc monitor HDMI-A-0 -d 13 14
    notify-send "Screen" "Second screen added..."
else
    sh /home/tobias/.screenlayout/withoutTV.sh
	#sed -i 's/HandleLidSwitch=.*/HandleLidSwitch=suspend/' /etc/systemd/logind.conf
    #sed -i 's/HandleLidSwitchExternalPower=.*/HandleLidSwitchExternalPower=suspend/' /etc/systemd/logind.conf
	bspc monitor eDP -d 1 2 3 4 5 6 7 8 9 10 11 12
	notify-send "Screen" "Second screen removed..."
fi

wal -i /home/tobias/dotfiles/background
