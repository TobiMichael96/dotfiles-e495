#!/bin/bash
connected=$(cat /sys/class/drm/card0/card0-HDMI-A-1/status)
if [ "$connected" == "connected" ]; then
    	sh /home/tobias/.screenlayout/withTV.sh
	#sed -i 's/HandleLidSwitch=.*/HandleLidSwitch=ignored/' /etc/systemd/logind.conf
        #sed -i 's/HandleLidSwitchExternalPower=.*/HandleLidSwitchExternalPower=ignored/' /etc/systemd/logind.conf
	bspc monitor LVDS1 -d 1 2 3 4 5 6 7 8
	bspc monitor HDMI1 -d 9 10
    	notify-send "Screen" "Second screen added..."
else
    	sh /home/tobias/.screenlayout/withoutTV.sh
	#sed -i 's/HandleLidSwitch=.*/HandleLidSwitch=suspend/' /etc/systemd/logind.conf
        #sed -i 's/HandleLidSwitchExternalPower=.*/HandleLidSwitchExternalPower=suspend/' /etc/systemd/logind.conf
	notify-send "Screen" "Second screen removed..."
	bspc monitor LVDS1 -d 1 2 3 4 5 6 7 8
fi

sh /home/tobias/dotfiles/scripts/hdmi_sound_toggle.sh
wal -i /home/tobias/dotfiles/background
