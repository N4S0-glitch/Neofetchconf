#!/bin/bash

# Configuration
#--------------
# Path to the categories configuration file
# Format of config file should be:
# CATEGORY_NAME=/path/to/wallpapers
# Example:
# Landscapes=/home/user/Wallpapers/Landscapes
# Abstract=/home/user/Wallpapers/Abstract
CONFIG_FILE="$HOME/.config/hypr/wallpaper-categories.conf"

# Wofi configuration file - modify this path if your wofi config is different
WOFI_CONFIG="$HOME/.config/wofi/config1"

# Error Handling
#--------------
# Check if config file exists and is not empty
if [ ! -f "$CONFIG_FILE" ] || [ ! -s "$CONFIG_FILE" ]; then
    notify-send "Error" "Wallpaper categories config file is missing or empty"
    exit 1
fi

# Category Selection
#------------------
# Extract category names from config file (everything before the = sign)
CATEGORIES=$(cat "$CONFIG_FILE" | cut -d'=' -f1)

# Present categories to user using wofi
SELECTED_CATEGORY=$(echo "$CATEGORIES" | wofi -c "$WOFI_CONFIG" --show dmenu --prompt "Select Category:")

# Debug: Show selected category
notify-send "Debug" "Selected category: $SELECTED_CATEGORY"
# Exit if no category was selected (user pressed Esc)
if [ -z "$SELECTED_CATEGORY" ]; then
    exit 0
fi

# Wallpaper Directory
#-------------------
# Get the directory path for the selected category from config file
WALLPAPER_DIR=$(grep "^$SELECTED_CATEGORY=" "$CONFIG_FILE" | cut -d'=' -f2)

# Debug: Show directory being searched
notify-send "Debug" "Searching in directory: $WALLPAPER_DIR"

# Validate the wallpaper directory
if [ -z "$WALLPAPER_DIR" ] || [ ! -d "$WALLPAPER_DIR" ]; then
    notify-send "Error" "Invalid wallpaper directory for category: $SELECTED_CATEGORY"
    exit 1
fi

# Wallpaper Selection
#-------------------
# Count images in directory
IMAGE_COUNT=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" \) | wc -l)

if [ "$IMAGE_COUNT" -eq 0 ]; then
    notify-send "Error" "No image files found in directory: $WALLPAPER_DIR"
    exit 1
fi

# Show available wallpapers from selected category
SELECTED_WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" \) -exec basename {} \; | wofi -c "$WOFI_CONFIG" --show dmenu --prompt "Select Wallpaper:")
# Exit if no wallpaper was selected (user pressed Esc)
if [ -z "$SELECTED_WALLPAPER" ]; then
    exit 0
fi

# Get the full path of the selected wallpaper
FULL_PATH=$(find "$WALLPAPER_DIR" -type f -name "$SELECTED_WALLPAPER")

# Debug: Show full path of selected wallpaper
notify-send "Debug" "Selected wallpaper path: $FULL_PATH"
# Validate the wallpaper path
if [ -z "$FULL_PATH" ]; then
    notify-send "Error" "Could not find selected wallpaper"
    exit 1
fi

swww img "$FULL_PATH" --transition-type any --transition-fps 60 --transition-duration .5


wal -i "$FULL_PATH" -b 000000
swaync-client --reload-css
cat ~/.cache/wal/colors-kitty.conf > ~/.config/kitty/current-theme.conf
pywalfox update
