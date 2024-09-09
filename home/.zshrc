# .zshrc by FrozenArcher

# if [[ "$(which tmux)" != "tmux not found" ]]; then
#     test -n "$PS1" && test -z "$TMUX" && exec tmux new -ADX
# fi
if test ! $(tmux ls > /dev/null 2>&1); then
    tmux start-server
    export TMUX_SERVER_STARTED="true"
fi

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
export PATH=$HOME/go/bin:$HOME/.cargo/bin:$HOME/.local/bin:$PATH
export GOPATH=$HOME/go
export DOT_REPO=$HOME/dotfiles
# conda
export CRYPTOGRAPHY_OPENSSL_NO_LEGACY=1
# solana
export PATH="$HOME/.local/share/solana/install/active_release/bin:$PATH"

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
alias kn="kitty nvim ."
alias knv="kitty nvim"
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
alias ta="tmux attach -t"
alias tas="tmux attach -t shell"

# Activate nvm
if [ -d /usr/share/nvm ]; then
    [ -z "$NVM_DIR" ] && export NVM_DIR="$HOME/.nvm"
    source /usr/share/nvm/nvm.sh
    source /usr/share/nvm/bash_completion
    source /usr/share/nvm/install-nvm-exec
fi

# Activate miniconda environment
[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh
