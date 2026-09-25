#!/bin/bash

set -euo pipefail

MY_NAME='rotate_wallpaper.sh'
WALLPAPERS_DIR="$HOME/Pictures/Wallpapers"
DBUS_ADDRESS_PATH='/run/user/1000/bus'
MAX_RETRIES=20
RETRY_DELAY=15 # in seconds

function wait_for_dbus {
    if [[ -e "$DBUS_ADDRESS_PATH" ]]; then
        return
    fi
    for i in $(seq "$MAX_RETRIES"); do
        echo "$MY_NAME: INFO: waiting for dbus session bus address $DBUS_ADDRESS_PATH to appear ($i/$MAX_RETRIES)"
        sleep "$RETRY_DELAY"
        if [[ -e "$DBUS_ADDRESS_PATH" ]]; then
            return
        fi
    done
    echo "$MY_NAME: WARNING: dbus session bus address $DBUS_ADDRESS_PATH does not seem to exist"
}

function choose_next_wallpaper {
    find "$WALLPAPERS_DIR" -type f,l | shuf -n 1
}

function set_wallpaper {
    export DISPLAY=':0'
    export DBUS_SESSION_BUS_ADDRESS="unix:path=$DBUS_ADDRESS_PATH"
    gsettings set org.gnome.desktop.background picture-uri "file://$next_wallpaper"
    gsettings set org.gnome.desktop.background picture-uri-dark "file://$next_wallpaper"
}

wait_for_dbus
next_wallpaper="$(choose_next_wallpaper)"
set_wallpaper "$next_wallpaper"
echo "$(date +'%Y-%m-%d %H:%M:%:S') $next_wallpaper"
