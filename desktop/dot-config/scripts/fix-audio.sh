#!/bin/sh

# Must kill wireplumber first, multiple instances cause bad problems with awesomewm
killall wireplumber
wireplumber
