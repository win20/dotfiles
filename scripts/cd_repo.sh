#!/bin/bash

# Directory to search
SEARCH_DIRS=(~/Developer/repos/)
CUSHON_DIR=~/Cushon/

if [ -d "$CUSHON_DIR" ]; then
  SEARCH_DIRS+=("$CUSHON_DIR")
fi

# Find all directories (excluding the root search dirs themselves)
find "${SEARCH_DIRS[@]}" -mindepth 1 -maxdepth 1 -type d 2>/dev/null | fzf | {
  read -r selected_dir
  if [[ -n "$selected_dir" ]]; then
    cd "$selected_dir"
  else
    echo "No directory selected."
  fi
}
