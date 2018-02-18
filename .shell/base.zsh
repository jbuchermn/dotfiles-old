source $SHELL_DIR/base.sh

plugins=(
    git
)

# ViM mode
bindkey -v
bindkey "^?" backward-delete-char

# oh-my-zsh
ZSH_THEME="spaceship"
source $ZSH/oh-my-zsh.sh

# zsh-autosuggestions
source $SH/zsh-autosuggestions/zsh-autosuggestions.zsh
