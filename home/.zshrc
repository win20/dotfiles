# ==== GENERAL SETTINGS ===
HISTFILE="$HOME/.zsh_history"
HISTSIZE=5000
SAVEHIST=$HISTSIZE

setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS

autoload -Uz compinit
compinit

bindkey "^h" backward-word
bindkey "^l" forward-word

# ==== VARIABLES & PATHS ====
export IS_WORK_LAPTOP=0

# Build PATH systematically - order matters (most specific first)
# Work-specific paths first
if [[ "$IS_WORK_LAPTOP" == "1" ]]; then
  export PATH="$HOME/Cushon/site/smarter-cli/bin:$PATH"
fi

# User-specific tool paths
export PATH="$HOME/.codeium/windsurf/bin:$PATH"
export PATH="$HOME/Library/Application Support/JetBrains/Toolbox/scripts:$PATH"

# Language-specific paths
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export GEM_HOME="$HOME/.gem"
export PATH="$GEM_HOME/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.rvm/bin:$PATH"

# PNPM setup
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Homebrew paths
export PATH="/opt/homebrew/opt/make/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"

# System Python (keep this after homebrew to prefer homebrew python)
export PATH="/usr/local/bin/python2:$PATH"

# Android development
export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

export GPG_TTY=$(tty)

# ==== VERSION MANAGERS ====
export NVM_DIR="$HOME/.nvm"
if [ -s "/opt/homebrew/opt/nvm/nvm.sh" ]; then
  . "/opt/homebrew/opt/nvm/nvm.sh"
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
elif [ -s "$NVM_DIR/nvm.sh" ]; then
  . "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
fi

export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Set searchable dirs for fcd()
SEARCHABLE_DIRS=(~/Developer/winbarua/ ~/Developer/haerd/)

# ==== WORK SPECIFIC ====
if [[ "$IS_WORK_LAPTOP" == "1" ]]; then
  export AWS_PROFILE=win.barua.test
  export EVINCED_PACKAGE_TOKEN=secret

  alias cc="cd ~/Cushon"
  alias site="cd ~/Cushon/site"
  alias app="cd ~/Cushon/app"
  alias els="cd ~/Cushon/employer-lead-service"
  alias mfa=". ~/.aws/mfa.sh"

  # SSH Key Management
  for KEY in ~/.ssh/Keys/*; do
    ssh-add -l | grep -q $(ssh-keygen -lf "$KEY" | awk '{print $2}') || \
      ssh-add --apple-use-keychain "$KEY"
  done

  SEARCHABLE_DIRS=(~/Developer/cushon/)
fi

# ==== CUSTOM FUNCTIONS ====
fcd() {
  local selected_dir
  selected_dir=$(find "${SEARCHABLE_DIRS[@]}" -mindepth 1 -maxdepth 1 -type d 2>/dev/null | fzf)
  if [[ -n "$selected_dir" ]]; then
    cd "$selected_dir"
  else
    echo "No directory selected."
  fi
}

# ==== SHARED ALIASES ====
alias ls="ls --color=auto"
alias la="ls -la"
alias ll="eza"
alias lll="eza --long"
alias lla="eza --all"
alias llt="eza --tree"
alias v="nvim"
alias repos="cd ~/Developer/repos"
alias dot="cd ~/Developer/repos/dotfiles"
alias cdr=". ~/Developer/repos/dotfiles/scripts/cd_repo.sh"
alias gs="git status"
alias ga="git add"
alias gc="git commit -m"
alias gd="git pull"
alias gu="git push"
alias gb="git checkout -b"
alias lg="lazygit"
alias zz="zellij"
alias zn="zellij attach --create"
alias zel="~/Developer/repos/dotfiles/scripts/zellij_sessionizer.sh"
alias vconf="nvim ~/.config/nvim"
alias zconf="nvim ~/.zshrc"

# ==== PLUGINS ====
if command -v brew >/dev/null 2>&1; then
  source "/opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
  source "/opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi

eval "$(fzf --zsh)"

# ==== CUSTOM PROMPT ====
autoload -U promptinit; promptinit
prompt pure

[[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path zsh)"
