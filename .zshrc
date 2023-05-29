export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/munki:/nvim-macos/bin/nvim:/usr/local/go/bin:$HOME/.cargo/bin
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# ZSH HOME
export ZSH=$HOME/.zsh

# HISTORY CONFIG
export HISTFILE=$ZSH/.zsh_history

# How many commands zsh will load to memory.
export HISTSIZE=10000

# How many commands history will save on file.
export SAVEHIST=10000

export GCM_CREDENTIAL_STORE=cache

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
alias v="nvim"

function dd() {
  if command -v yay > /dev/null; then
    yay -S $1
  elif command -v pacman > /dev/null; then 
    sudo pacman -S $1
  elif command -v dnf > /dev/null; then 
    sudo dnf install $1
  else
    echo "No package manager found"
  fi
}

# Navigation
alias repos="cd ~/Dev/_repos"
alias vconf="cd ~/.config/nvim"

# Git 
alias gs="git status"
alias ga="git add"
alias gc="git commit -m"
alias gd="git pull"
alias gu="git push"
alias gb="git checkout -b"
alias lg="lazygit"

# Tmux
alias tkn="tmux kill-ses -t"      # kill session by name
alias tka="tmux kill-ses -a"      # kill all sessions but the current
alias tks="tmux kill-session"     # kill current session
alias tls="tmux ls"   
alias tn="tmux new -s"            
alias ta="tmux attach-session"    # attach last session
alias tas="tmux attach -t"        # attach session by name

# Load Starship prompt
eval "$(starship init zsh)"


