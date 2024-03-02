#usr/bin/env bash

#start swww the wallpaper daemon
swww init 

export WAYLAND_DISPLAY=1 &WAYLAND_DISPLAY

sleep 1

#waybar & chime
nohup waybar  & 

# mpv ~/Downloads/macchime.mp3


#start Swaync and other related items

swaync
avizo-server
