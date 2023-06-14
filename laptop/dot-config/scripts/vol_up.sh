#!/bin/sh

# Increase the volume:
amixer -q sset Master 5%+

VOL=$(amixer sget Master | awk -F"[][]" '/dB/ { print $2 }')
notify-send "Volume changed:" "$VOL" -u low
