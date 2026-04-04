#! /usr/bin/env bash

set -euo pipefail

THEME_NAME="HoneyOats"

######################################################################
# Active Icons
######################################################################
# Normal
MENU_ACTIVE="silver-icons-less-rounded/menu-active.png"
ICONIFY_ACTIVE="silver-icons-less-rounded/iconify-active.svg"
MAX_ACTIVE="silver-icons-less-rounded/max-active.svg"
MAX_TOGGLED_ACTIVE="$MAX_ACTIVE"
CLOSE_ACTIVE="red-icons-less-rounded/close-active.svg"

# Hover
MENU_HOVER_ACTIVE="silver-icons-less-rounded/menu-active.png"
ICONIFY_HOVER_ACTIVE="silver-icons-less-rounded/iconify-active.svg"
MAX_HOVER_ACTIVE="silver-icons-less-rounded/max-active.svg"
MAX_TOGGLED_HOVER_ACTIVE="$MAX_HOVER_ACTIVE"
CLOSE_HOVER_ACTIVE="silver-icons-less-rounded/close-active.svg"

######################################################################
# Inactive Icons
######################################################################
# Normal
MENU_INACTIVE="silver-icons-less-rounded/menu-inactive.png"
ICONIFY_INACTIVE="silver-icons-less-rounded/iconify-active.svg"
MAX_INACTIVE="silver-icons-less-rounded/max-active.svg"
MAX_TOGGLED_INACTIVE="$MAX_INACTIVE"
CLOSE_INACTIVE="black-icons-less-rounded/close-active.svg"

# Hover
MENU_HOVER_INACTIVE="silver-icons-less-rounded/menu-inactive.png"
ICONIFY_HOVER_INACTIVE="silver-icons-less-rounded/iconify-active.svg"
MAX_HOVER_INACTIVE="silver-icons-less-rounded/max-active.svg"
MAX_TOGGLED_HOVER_INACTIVE="$MAX_HOVER_INACTIVE"
CLOSE_HOVER_INACTIVE="silver-icons-less-rounded/close-active.svg"

icon_dir="$HOME/.themes/$THEME_NAME/labwc"

if [ ! -d "$icon_dir" ]; then
    echo "Icon directory $icon_dir not found"

    exit 1
fi

######################################################################
# Copy active Icons
######################################################################
# Normal
cp "$MENU_ACTIVE" "$icon_dir/menu-active.png"
cp "$ICONIFY_ACTIVE" "$icon_dir/iconify-active.svg"
cp "$MAX_ACTIVE" "$icon_dir/max-active.svg"
cp "$MAX_TOGGLED_ACTIVE" "$icon_dir/max_toggled-active.svg"
cp "$CLOSE_ACTIVE" "$icon_dir/close-active.svg"

# # Hover
# cp "$MENU_HOVER_ACTIVE" "$icon_dir/menu_hover-active.png"
# cp "$ICONIFY_HOVER_ACTIVE" "$icon_dir/iconify_hover-active.svg"
# cp "$MAX_HOVER_ACTIVE" "$icon_dir/max_hover-active.svg"
# cp "$MAX_TOGGLED_HOVER_ACTIVE" "$icon_dir/max_toggled_hover-active.svg"
# cp "$CLOSE_HOVER_ACTIVE" "$icon_dir/close_hover-active.svg"

######################################################################
# Copy inactive icons
######################################################################
# Normal
cp "$MENU_INACTIVE" "$icon_dir/menu-inactive.png"
cp "$ICONIFY_INACTIVE" "$icon_dir/iconify-inactive.svg"
cp "$MAX_INACTIVE" "$icon_dir/max-inactive.svg"
cp "$MAX_TOGGLED_INACTIVE" "$icon_dir/max_toggled-inactive.svg"
cp "$CLOSE_INACTIVE" "$icon_dir/close-inactive.svg"

# # Hover
# cp "$MENU_HOVER_INACTIVE" "$icon_dir/menu_hover-inactive.png"
# cp "$ICONIFY_HOVER_INACTIVE" "$icon_dir/iconify_hover-inactive.svg"
# cp "$MAX_HOVER_INACTIVE" "$icon_dir/max_hover-inactive.svg"
# cp "$MAX_TOGGLED_HOVER_INACTIVE" "$icon_dir/max_toggled_hover-inactive.svg"
# cp "$CLOSE_HOVER_INACTIVE" "$icon_dir/close_hover-inactive.svg"

