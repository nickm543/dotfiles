#!/bin/sh

# Update dotfiles

CONF=$HOME/.config
DEST=./desktop/dot-config

cp -rv $CONF/alacritty $DEST
cp -rv $CONF/i3 $DEST
cp -rv $CONF/i3status $DEST
cp -rv $CONF/picom $DEST
cp -rv $CONF/rofi $DEST
cp -rv $CONF/wallpaper $DEST

echo "[*] Copied configs."
