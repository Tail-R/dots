#! /usr/bin/env bash

set -euo pipefail

THEME_NAME="HoneyOats"

# Active Icons
ACTIVE_CLOSE="red-icons-less-rounded/close-active.svg"
ACTIVE_MAX="silver-icons-less-rounded/max-active.svg"
ACTIVE_MAX_TOGGLED="$ACTIVE_MAX"
ACTIVE_ICONIFY="silver-icons-less-rounded/iconify-active.svg"
ACTIVE_MENU="silver-icons-less-rounded/menu-active.png"

# Inactive Icons
INACTIVE_CLOSE="black-icons-less-rounded/close-active.svg"
INACTIVE_MAX="silver-icons-less-rounded/max-active.svg"
INACTIVE_MAX_TOGGLED="$ACTIVE_MAX"
INACTIVE_ICONIFY="silver-icons-less-rounded/iconify-active.svg"
INACTIVE_MENU="silver-icons-less-rounded/menu-inactive.png"

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

