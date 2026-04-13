#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

scripts=(
    "install-wl-paste.sh"
    "install-translate.sh"
)

sudo -v
for script in "${scripts[@]}"; do
    chmod +x "$SCRIPT_DIR/$script"
    "$SCRIPT_DIR/$script"
done



