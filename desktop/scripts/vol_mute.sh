#!/bin/sh

# Increase volume and send a notification

pactl set-sink-volume 1 toggle
notify-send "🔇Volume Muted"
