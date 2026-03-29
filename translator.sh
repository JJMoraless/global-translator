#!/bin/bash

CURSOR_POS=$(hyprctl cursorpos | sed 's/,//g')
CURSOR_X=$(echo $CURSOR_POS | cut -d' ' -f1)
CURSOR_Y=$(echo $CURSOR_POS | cut -d' ' -f2)
TARGET_X=$((CURSOR_X))
TARGET_Y=$((CURSOR_Y))

path_panel_translation="$HOME/working/me/scripts/translate/show_translation.sh"

hyprctl dispatch exec \
"[float;size 800 400;move $TARGET_X $TARGET_Y;pin] ghostty --class=ghosty-float --font-size=12 -e bash $path_panel_translation"