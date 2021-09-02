#!/bin/sh

# Increase volume and send a notification

pactl set-sink-volume 1 +5%
notify-send "🔊Volume Increase:" $(pactl list sinks | grep "#1" -A 10 | grep Volume | cut -d " " -f6)
