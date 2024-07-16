#!/bin/bash

playerctl pause

$HOME/.config/hypr/scripts/wallchange.sh

#wallpaper_path_one=$(wpaperctl get-wallpaper eDP-1 | tr -d '"')
#if [[ "$wallpaper_path_one" != *.png ]]; then
#    wallpaper_path_one=/usr/share/backgrounds/9.png
#else
#    wallpaper_path_one=$HOME/.current_wallpaper_eDP-1
#fi
#
#wallpaper_path_two=$(wpaperctl get-wallpaper HDMI-A-1 | tr -d '"')
#if [[ "$wallpaper_path_two" != *.png ]]; then
#    wallpaper_path_two=/usr/share/backgrounds/9.png
#else
#    wallpaper_path_two=$HOME/.current_wallpaper_HDMI-A-1
#fi

wallpaper_path_one=$HOME/.current_wallpaper_eDP-1
wallpaper_path_two=$HOME/.current_wallpaper_HDMI-A-1

# Define the configuration file path
config_file="$HOME/.config/hypr/hyprlock.conf"

# Use sed to replace the path value in the configuration file
sed -i "/monitor = eDP-1/,/path =/ s|path = .*|path = $wallpaper_path_one|" "$config_file"
sed -i "/monitor = HDMI-A-1/,/path =/ s|path = .*|path = $wallpaper_path_two|" "$config_file"

hyprlock
