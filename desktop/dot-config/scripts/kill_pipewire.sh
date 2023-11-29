#!/bin/bash

# Kill pipewire
echo "Killing pipewire..."
sudo pkill wireplumber
sudo pkill pipewire-pulse
sudo pkill pipewire
