#!/bin/bash

if [ ! -z "$1" ] ; then
    name="$1"
else
    name="screenshot$(date +'%m%d%y%H%M%S')"
fi

take_screenshot () {
    # xfce4-screenshooter -fs ~/Pictures/$name.png
    maim ~/Pictures/$name.png -u
    # scrot "$1.png" -e 'mv $f ~/Pictures/'

    message="Full screenshot captured ➜ $name.png"
    [ -f "$HOME/Pictures/$1.png" ] && notify-send "$message"
}

take_screenshot $name
