#!/bin/bash

if $(ip a | grep 'zt' | grep -q '172'); then
	echo "ZT Online"
else
	echo "ZT Offline"
fi
