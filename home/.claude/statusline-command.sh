#!/bin/bash

# Read JSON input from stdin
input=$(cat)

# Extract information from the JSON
model_name=$(echo "$input" | jq -r '.model.display_name')
current_dir=$(echo "$input" | jq -r '.workspace.current_dir')
remaining=$(echo "$input" | jq -r '.context_window.remaining_percentage // empty')

# Try to extract input/output tokens from current usage
input_tokens=$(echo "$input" | jq -r '.context_window.current_usage.input_tokens // empty')
output_tokens=$(echo "$input" | jq -r '.context_window.current_usage.output_tokens // empty')

# Get git branch if in a git repo
git_branch=""
if git -C "$current_dir" rev-parse --git-dir > /dev/null 2>&1; then
  git_branch=$(git -C "$current_dir" branch --show-current 2>/dev/null)
  if [[ -z "$git_branch" ]]; then
    git_branch=$(git -C "$current_dir" rev-parse --short HEAD 2>/dev/null)
  fi
fi

# Get project/repository name
if git -C "$current_dir" rev-parse --git-dir > /dev/null 2>&1; then
  repo_name=$(basename "$(git -C "$current_dir" rev-parse --show-toplevel 2>/dev/null)")
else
  repo_name=$(basename "$current_dir")
fi

# Calculate percentage
used_pct=""
if [[ -n "$remaining" ]]; then
  remaining_int=${remaining%.*}
  used_pct=$((100 - remaining_int))
fi

# Build first line: Model name | Ctx %: percentage | input In / output Out
line1="${model_name}"

if [[ -n "$used_pct" ]]; then
  line1+=" | Ctx %: ${used_pct}%"
fi

if [[ -n "$input_tokens" && -n "$output_tokens" ]]; then
  line1+=" | ${input_tokens} In / ${output_tokens} Out"
fi

# Build second line: Current directory name (Git branch)
line2="$repo_name"
if [[ -n "$git_branch" ]]; then
  line2+=" ($git_branch)"
fi

# Output both lines
echo "${line1}"
echo "$line2"
