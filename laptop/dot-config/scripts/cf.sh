#!/bin/sh

# Script to choose config to edit

CONFIG='/home/nick/.config'
CHOICE=$(echo -e "AWESOME\nALACRITTY\nZSH\nNVIM" | fzf)

case $CHOICE in

    'AWESOME')
        nvim $CONFIG/awesome/rc.lua
        ;;

    'ALACRITTY')
        nvim $CONFIG/alacritty/alacritty.yml
        ;;

    'ZSH')
        nvim /home/nick/.zshrc
        ;;

    'NVIM')
        nvim $CONFIG/nvim/init.lua
        ;;
esac
