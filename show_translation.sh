#!/bin/bash

TEXT=$(wl-paste -p)
[ -z "$TEXT" ] && TEXT=$(wl-paste)
[ -z "$TEXT" ] && exit 0
TEXT=$(echo "$TEXT")
ORIGINAL_TEXT="$TEXT"

clear
echo -e "\e[1;34m[...]\e[0m traduciendo..."
echo -e "\e[1;30m----------------------------------------\e[0m"


TARGET_LANG="es"
UI_LANG="Español"

WORD_COUNT=$(echo "$ORIGINAL_TEXT" | wc -w)

if [ "$WORD_COUNT" -eq 1 ]; then
    DICCIONARIO=$(trans -d -to "$TARGET_LANG" "$ORIGINAL_TEXT" 2>/dev/null)
else
    TRADUCCION=$(trans -b -to "$TARGET_LANG" "$ORIGINAL_TEXT")
fi

# 3. Renderizado final
clear
if [ "$WORD_COUNT" -eq 1 ]; then
    echo -e "\e[1;35m--- 📖 DICCIONARIO: \"$ORIGINAL_TEXT\" ---\e[0m"
    echo
    echo "$DICCIONARIO"
    echo
else
    echo -e "\e[1;32m--- 🪓 TRADUCCIÓN ($UI_LANG) ---\e[0m"
    echo
    echo "$TRADUCCION"
    echo
fi
echo -e "\e[1;33m-----------------------------\e[0m"
echo "Presione cualquier tecla para cerrar..."

# Esperar entrada para cerrar
read -n 1