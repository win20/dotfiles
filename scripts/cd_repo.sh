#!/bin/bash

# Directory to search
SEARCH_DIR=~/Developer/repos/

# Use fzf to select a directory
selected_dir=$(find "$SEARCH_DIR" -maxdepth 1 -type d | fzf)

# If a selection was made, cd into it
if [[ -n "$selected_dir" ]]; then
  cd "$selected_dir"
else
  echo "No directory selected."
fi

