#!/bin/sh

if ! pgrep -x "picom" > /dev/null; then
    picom &disown
fi
