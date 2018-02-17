source ~/.bashrc

plugins=(
    git
)

# ViM mode
bindkey -v
bindkey "^?" backward-delete-char

# oh-my-zsh
export ZSH=~/.zsh/oh-my-zsh
ZSH_THEME="spaceship"
source $ZSH/oh-my-zsh.sh

# zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
