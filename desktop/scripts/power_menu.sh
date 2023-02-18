#!/bin/sh

OPTIONS="Shutdown...\nReboot..."

CHOICE=$(echo -e $OPTIONS | rofi -dmenu -p "Power Menu")

case $CHOICE in
    "Shutdown...")
        sudo shutdown -h now
    ;;
    "Reboot...")
        sudo reboot
    ;;
esac
