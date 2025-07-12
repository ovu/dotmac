#!/bin/bash

# Get the directory where the script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Set the source fish history file
SRC="$HOME/.local/share/fish/fish_history"

# Copy the fish history file to the script's directory
cp "$SRC" "$SCRIPT_DIR/fish_history"

echo "Fish history copied to $SCRIPT_DIR/fish_history" 