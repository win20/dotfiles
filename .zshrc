# ZSH HOME
export ZSH=$HOME/.zsh

# HISTORY CONFIG
export HISTFILE=$ZSH/.zsh_history

# How many commands zsh will load to memory.
export HISTSIZE=10000

# How many commands history will save on file.
export SAVEHIST=10000

# History won't save duplicates.
setopt HIST_IGNORE_ALL_DUPS

# History won't show duplicates on search.
setopt HIST_FIND_NO_DUPS


### ALIASES ###
alias la="ls -la"

alias v=nvim

# Navigation
alias repos="cd ~/Developer/repos"
alias vconf="nvim ~/.config/nvim"
alias zconf="nvim ~/.zshrc"
alias wezconf="nvim ~/.config/wezterm/wezterm.lua"
alias dot="nvim ~/Developer/repos/dotfiles"

# Git
alias gs="git status"
alias ga="git add"
alias gc="git commit -m"
alias gd="git pull"
alias gu="git push"
alias gb="git checkout -b"

# Plugins
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Pure prompt
fpath+=("$(brew --prefix)/share/zsh/site-functions")
autoload -U promptinit; promptinit
prompt pure

# Load nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/Users/winbarua/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
