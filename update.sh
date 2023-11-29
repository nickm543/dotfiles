#!/bin/sh

# Update dotfiles

if [ $# -eq 0 ]; then
	echo 'Usage: ./update.sh <desktop|laptop>'
	exit 1
fi

CONF=$HOME/.config
if [ "$1" = "desktop" ]; then
	DEST=./desktop/dot-config
else
	DEST=./laptop/dot-config
fi

cp -rv $CONF/alacritty $DEST
cp -rv $CONF/awesome $DEST
cp -rv $CONF/picom $DEST
cp -rv $CONF/rofi $DEST
cp -rv $CONF/wallpaper $DEST
cp -rv $CONF/scripts $DEST
cp -rv $CONF/nvim $DEST

echo "[*] Copied configs."
