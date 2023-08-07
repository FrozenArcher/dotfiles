#!/bin/sh

case $1 in
    dmenu)
        rofi -show drun -config ~/.config/rofi/rofi-dmenu.rasi
        ;;
    *)
        echo "Argument $1 not found."
        exit 1
        ;;
esac
