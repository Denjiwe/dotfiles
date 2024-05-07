#!/bin/bash

sleep 0.5

HOME=/home/santhiago
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"

wallpaper_path_one=$(wpaperctl get-wallpaper eDP-1 | tr -d '"')
wallpaper_path_two=$(wpaperctl get-wallpaper HDMI-A-1 | tr -d '"')

config_file_one="$HOME/.current_wallpaper_eDP-1"
config_file_two="$HOME/.current_wallpaper_HDMI-A-1"
config_file_order="$HOME/.current_wallpaper_order"

cp $wallpaper_path_one $config_file_one
cp $wallpaper_path_two $config_file_two

current_wallpaper=$(grep ... "$HOME/.current_wallpaper")

if [[ "$wallpaper_path_one" != "$current_wallpaper" ]]; then
    echo $wallpaper_path_one > "$HOME/.current_wallpaper"

    if [[ "$wallpaper_path_two" == "" ]]; then
        cp $wallpaper_path_one $config_file_order
        wal -i "$wallpaper_path_one"
    else
        cp $wallpaper_path_two $config_file_order
        wal -i "$wallpaper_path_two"
    fi

    swaync-client -rs
fi

