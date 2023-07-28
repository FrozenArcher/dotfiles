# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
zstyle ':omz:update' mode reminder  # just remind me to update when it's time
zstyle ':omz:update' frequency 21
DISABLE_MAGIC_FUNCTIONS="true"
DISABLE_AUTO_TITLE="true"
# COMPLETION_WAITING_DOTS="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"
# HIST_STAMPS="mm/dd/yyyy"
# ZSH_CUSTOM=/path/to/new-custom-folder

plugins=(
	git
	zsh-syntax-highlighting
	zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

# Environment Variables

export http_proxy="http://127.0.0.1:7890"
export https_proxy="http://127.0.0.1:7890"
export PATH=$HOME/.local/bin:$PATH

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR='vim'
else
	export EDITOR='nvim'
fi

# Aliases
LS_CMD="lsd"

if command -v systemctl > /dev/null; then
    POWEROFF="systemctl poweroff"
    REBOOT="systemctl reboot"
elif command -v loginctl > /dev/null; then
    POWEROFF="loginctl poweroff"
    REBOOT="loginctl reboot"
else
    POWEROFF="sudo init 0"
    REBOOT="sudo init 6"
fi

alias n="nvim ."
alias nv="nvim"
alias sczsh="source ~/.zshrc"
alias xon="export http_proxy=http://127.0.0.1:7890;export https_proxy=http://127.0.0.1:7890"
alias xof="unset http_proxy https_proxy"
alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
alias c="config"
alias ccm="config commit -m"
alias cpm="config push origin main"
alias g="git"
alias gaa="git add ."
alias gcm="git commit -m"
alias gps="git push"
alias cl="clear"
alias ll="$LS_CMD -l"
alias la="$LS_CMD -lA"
alias ff="fastfetch"
alias po="$POWEROFF"
alias rb="$REBOOT"
