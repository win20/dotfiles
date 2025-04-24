#!/usr/bin/env bash

if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=$(find ~/Cushon ~/Developer/repos -mindepth 1 -maxdepth 1 -type d | fzf)
fi

if [[ -z $selected ]]; then
    exit 0
fi

selected_name=$(basename "$selected" | tr . _)
zellij_running=$(pgrep zellij)

# Check if we're already in a zellij session
if [[ -z $ZELLIJ ]] && [[ -z $zellij_running ]]; then
    # If no zellij session exists, create a new one
    cd "$selected" && zellij --session $selected_name
    exit 0
fi

# Check if session exists
if ! zellij list-sessions | grep -q "$selected_name"; then
    # Create new session if it doesn't exist
   cd "$selected" && zellij --session $selected_name
else
    # Attach to existing session
    zellij attach $selected_name
fi

