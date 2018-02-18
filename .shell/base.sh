# dotfiles repo in ~/.dotfiles
function dotfiles {
   git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}
dotfiles config --local status.showUntrackedFiles no

export PATH=${PATH}:/usr/local/sbin
export PATH=/usr/local/bin:${PATH}

export ANDROID_HOME=${HOME}/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools
export PATH=${PATH}:/usr/local/opt/llvm/bin

source $SHELL_DIR/z/z.sh

export TMPDIR=/tmp

#export CXX=g++-7
export CXX=mpicxx
export OMPI_CXX=g++-7

function md { 
    mkdir -p "$@" && cd "$1"; 
}

function fd {
    cd $(find ${1:-.} -type d | fzy)
}

function ld {
    ls $(find ${1:-.} | fzy)
}

# ViM mode
set -o vi

