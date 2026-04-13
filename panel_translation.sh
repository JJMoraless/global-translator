#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/utils/draw_box.sh"
source "$SCRIPT_DIR/utils/loading.sh"

if ! command -v wl-paste &>/dev/null; then
    echo "error: wl-paste is not installed." >&2
    exit 1
fi

if ! command -v trans &>/dev/null; then
    echo "error: translate-shell is not installed." >&2
    exit 1
fi


text_selected=$(wl-paste -p)
[ -z "$text_selected" ] && text_selected=$(wl-paste)
[ -z "$text_selected" ] && exit 0


# loading animation
clear
show_loading "traduciendo..." &
loading_pid=$!

target_lang="es"
ui_lang="Español"
world_count=$(echo "$text_selected" | wc -w)

if [ "$world_count" -eq 1 ]; then
    dictionary=$(trans -d -to "$target_lang" "$text_selected" 2>/dev/null)
else
    traduction=$(trans -b -to "$target_lang" "$text_selected")
fi

# kill loading animation
kill $loading_pid 2>/dev/null
clear


if [ "$world_count" -eq 1 ]; then
    draw_box "📖 Dictionary: $text_selected" "$dictionary" "\e[1;35m"
else
    draw_box "📑 Translate ($ui_lang)" "$traduction" "\e[1;32m"
fi

echo "press any key to close..."

# wait input to close the window
read -n 1