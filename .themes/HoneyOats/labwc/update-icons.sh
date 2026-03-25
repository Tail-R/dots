#! /usr/bin/env bash

set -euo pipefail

THEME_NAME="HoneyOats"

# Active Icons
ACTIVE_CLOSE="$HOME/Downloads/close-active.svg"
ACTIVE_MAX="$HOME/Downloads/heart-active.svg"
ACTIVE_MAX_TOGGLED="$ACTIVE_MAX"
ACTIVE_ICONIFY="$HOME/Downloads/iconify-active.svg"
ACTIVE_MENU="$HOME/Downloads/rabbit.png"

# Inactive Icons
INACTIVE_CLOSE="$HOME/Downloads/close-inactive.svg"
INACTIVE_MAX="$HOME/Downloads/heart-inactive.svg"
INACTIVE_MAX_TOGGLED="$INACTIVE_MAX"
INACTIVE_ICONIFY="$HOME/Downloads/iconify-inactive.svg"
INACTIVE_MENU="$HOME/Downloads/rabbit-dead.png"

icon_dir="$HOME/.themes/$THEME_NAME/labwc"

if [ ! -d "$icon_dir" ]; then
    echo "Icon directory $icon_dir not found"

    exit 1
fi

# Copy active Icons
cp "$ACTIVE_CLOSE" "$icon_dir/close-active.svg"
cp "$ACTIVE_MAX" "$icon_dir/max-active.svg"
cp "$ACTIVE_MAX_TOGGLED" "$icon_dir/max_toggled-active.svg"
cp "$ACTIVE_ICONIFY" "$icon_dir/iconify-active.svg"
cp "$ACTIVE_MENU" "$icon_dir/menu-active.png"

# Copy inactive icons
cp "$INACTIVE_CLOSE" "$icon_dir/close-inactive.svg"
cp "$INACTIVE_MAX" "$icon_dir/max-inactive.svg"
cp "$INACTIVE_MAX_TOGGLED" "$icon_dir/max_toggled-inactive.svg"
cp "$INACTIVE_ICONIFY" "$icon_dir/iconify-inactive.svg"
cp "$INACTIVE_MENU" "$icon_dir/menu-inactive.png"

