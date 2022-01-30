#!/bin/sh

# Toggle audio between muted and unmuted
amixer sset Master toggle

notify-send "Volume toggled." -u low
# TODO: Actually get muted status and show notification based on that
