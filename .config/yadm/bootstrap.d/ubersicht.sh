#!/bin/bash

set -eu

SYSTEM_TYPE=$(uname -s)

SIMPLE_BAR_FOLDER="$HOME/Library/Application Support/Übersicht/widgets/simple-bar"
CUSTOM_STYLES_FILE="$SIMPLE_BAR_FOLDER/lib/styles/custom-styles.js"
THEMES_FILE="$SIMPLE_BAR_FOLDER/lib/styles/themes.js"
SPACEDUCK_THEME_FILE="$SIMPLE_BAR_FOLDER/lib/styles/themes/spaceduck.js"

if [ "$SYSTEM_TYPE" = "Darwin" ]; then
    if [ ! -d "$SIMPLE_BAR_FOLDER" ]; then
        git clone https://github.com/Jean-Tinland/simple-bar "$SIMPLE_BAR_FOLDER"
    fi

    [[ -L "$CUSTOM_STYLES_FILE" || -f "$CUSTOM_STYLES_FILE" ]] && rm "$CUSTOM_STYLES_FILE"
    ln "$HOME/.config/simple-bar/custom-styles.js" "$CUSTOM_STYLES_FILE"
    [[ -L "$THEMES_FILE" || -f "$THEMES_FILE" ]] && rm "$THEMES_FILE"
    ln "$HOME/.config/simple-bar/themes.js" "$THEMES_FILE"
    [[ -L "$SPACEDUCK_THEME_FILE" || -f "$SPACEDUCK_THEME_FILE" ]] && rm "$SPACEDUCK_THEME_FILE"
    ln "$HOME/.config/simple-bar/spaceduck.js" "$SPACEDUCK_THEME_FILE"

    echo "simple-bar ✅"
fi