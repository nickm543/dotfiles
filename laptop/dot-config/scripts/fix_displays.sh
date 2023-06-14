#!/bin/sh

# Loop over connected displays and output to them correctly

OUTPUTS=$(xrandr | grep ' connected' | cut -d ' ' -f1)

while IFS= read -r display; do
	xrandr --output "$display" --mode 2560x1440 --rate 144
done <<< "$OUTPUTS"
