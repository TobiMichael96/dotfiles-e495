#!/bin/bash
connected_hdmi=$(cat /sys/class/drm/card0/card0-HDMI-A-1/status)
connected_dp=$(cat /sys/class/drm/card0/card0-DP-2/status)
if [ "$connected_hdmi" == "connected" ]; then
    sh ~/.screenlayout/withTV.sh
    #sed -i 's/HandleLidSwitch=.*/HandleLidSwitch=ignored/' /etc/systemd/logind.conf
    #sed -i 's/HandleLidSwitchExternalPower=.*/HandleLidSwitchExternalPower=ignored/' /etc/systemd/logind.conf
    bspc monitor eDP -d 1 2 3 4 5 6 7 8 9 10 11 12
    bspc monitor HDMI-A-0 -d 13 14
    notify-send "Screen" "Second screen (HDMI) added..."
elif [ "$connected_dp" == "connected" ]; then
    sh ~/.screenlayout/withScreen.sh
    #sed -i 's/HandleLidSwitch=.*/HandleLidSwitch=ignored/' /etc/systemd/logind.conf
    #sed -i 's/HandleLidSwitchExternalPower=.*/HandleLidSwitchExternalPower=ignored/' /etc/systemd/logind.conf
    sh ~/.config/polybar/launch.sh
    sh ~/dotfiles/scripts/move_desktops.sh
    setxkbmap de
    notify-send "Screen" "Second screen (DP) added..."
else
    sh ~/.screenlayout/withoutTV.sh
    #sed -i 's/HandleLidSwitch=.*/HandleLidSwitch=suspend/' /etc/systemd/logind.conf
    #sed -i 's/HandleLidSwitchExternalPower=.*/HandleLidSwitchExternalPower=suspend/' /etc/systemd/logind.conf
    bspc monitor eDP -d 1 2 3 4 5 6 7 8 9 10 11 12
    notify-send "Screen" "Second screen removed..."
fi

bspc config external_rules_command ~/.config/bspwm/bspwm-rules
wal -i ~/dotfiles/background
