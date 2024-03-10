#!/usr/bin/env sh

ZOOM_LEVEL=$(hyprctl getoption misc:cursor_zoom_factor | awk 'NR==3{print $2}')

if [ "$1" = "zoom-in" ]; then
	ZOOM_LEVEL=$(echo $ZOOM_LEVEL + 0.2 | bc -l)
	if [ $(echo "$ZOOM_LEVEL > 4" | bc -l) -eq 1 ]; then
		ZOOM_LEVEL=4
	fi
	hyprctl keyword misc:cursor_zoom_factor $ZOOM_LEVEL
elif [ "$1" = "zoom-out" ]; then
	ZOOM_LEVEL=$(echo $ZOOM_LEVEL - 0.2 | bc -l)
	if [ $(echo "$ZOOM_LEVEL < 1" | bc -l) -eq 1 ]; then
		ZOOM_LEVEL=1
	fi
	hyprctl keyword misc:cursor_zoom_factor $ZOOM_LEVEL
elif [ "$1" = "zoom-reset" ]; then
	hyprctl keyword misc:cursor_zoom_factor 1
else
	echo "Usage: magnifier.sh [zoom-in|zoom-out|zoom-reset]"
fi
