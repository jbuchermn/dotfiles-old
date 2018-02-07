export ZSH=~/.oh-my-zsh
ZSH_THEME="nicoulaj"

plugins=(
    git
)

bindkey -v
bindkey "^?" backward-delete-char
#export KEYTIMEOUT=1

source $ZSH/oh-my-zsh.sh
source ~/.bashrc
