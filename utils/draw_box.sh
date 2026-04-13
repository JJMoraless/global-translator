#!/bin/bash


draw_box() {
    local title="$1"
    local content="$2"
    local color="$3"
    printf "${color}┌───── %s ───────────────────────────\033[0m\n" "$title"
    printf "${color}│\033[0m\n"
    while IFS= read -r line; do
        printf "${color}│ %s\033[0m\n" "$line"
    done <<< "$content"
    printf "${color}└────────────────────────────────\033[0m\n"

}