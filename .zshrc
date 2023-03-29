export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/munki:$HOME/Dev/nvim-macos/bin
export PATH="/opt/homebrew/bin:$PATH" >> ~/.zshrc

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

### PLUGINS
source $ZSH/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
source $ZSH/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZSH/plugins/zsh-z/zsh-z.plugin.zsh

bindkey -v

### ALIASES ###
alias la='ls -la'

# navigation
alias dev="cd ~/Dev"
alias repos="cd ~/Dev/_repos"
alias vconf="cd ~/.config/nvim"

alias v="nvim"

# GIT #
alias gs="git status"
alias ga="git add"
alias gc="git commit -m"
alias gd="git pull"
alias gu="git push"
alias gb="git checkout -b"

# tmux
alias ksn="tmux kill-ses -t"
alias ksa="tmux kill-ses -a"
alias ks="tmux kill-session"
alias tls="tmux ls"
alias tn="tmux new -s"

# Load Starship prompt
eval "$(starship init zsh)"

