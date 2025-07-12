#!/bin/bash

# Get the directory where the script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Set the source bookmarks file
SRC="$HOME/Library/Application Support/Google/Chrome/Default/Bookmarks"

# Copy the bookmarks file to the script's directory
cp "$SRC" "$SCRIPT_DIR/Bookmarks"

echo "Chrome bookmarks copied to $SCRIPT_DIR/Bookmarks" 