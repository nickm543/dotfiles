#!/bin/sh

# Restart it
echo "Restarting pipewire..."
pipewire &disown
pipewire-pulse &disown
wireplumber &disown
