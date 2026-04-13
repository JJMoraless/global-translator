#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

path_panel_translation="$SCRIPT_DIR/panel_translation.sh"

if [ "$XDG_CURRENT_DESKTOP" = "KDE" ] || [ "$XDG_CURRENT_DESKTOP" = "kde" ] || [ "$DESKTOP_SESSION" = *kde* ]; then

    # not way to reposition the window to cursor position in kde without latency
    # position=$(kdotool getmouselocation --shell)
    # x=$(echo "$position" | grep ^X= | cut -d= -f2)
    # y=$(echo "$position" | grep ^Y= | cut -d= -f2)
    
    ghostty \
        --window-decoration=false \
        -e bash $path_panel_translation

elif command -v hyprctl &>/dev/null; then
    CURSOR_POS=$(hyprctl cursorpos | sed 's/,//g')
    CURSOR_X=$(echo $CURSOR_POS | cut -d' ' -f1)
    CURSOR_Y=$(echo $CURSOR_POS | cut -d' ' -f2)

    hyprctl dispatch exec \
    "[float;size 800 400;move $CURSOR_X $CURSOR_Y;pin] ghostty --class=ghosty-float --font-size=12 -e bash $path_panel_translation"
fi