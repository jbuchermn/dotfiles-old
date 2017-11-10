#
# dotfiles git repo in ~/.cfg
# See https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/
#
function dotfiles {
   git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}
dotfiles config --local status.showUntrackedFiles no


export ANDROID_HOME=${HOME}/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools

source ~/._z/z.sh
source ~/.oh-my-git/prompt.sh

export TMPDIR=/tmp

#export CXX=g++-7

export CXX=mpicxx
export OMPI_CXX=g++-7

PLOT(){
    python ~/Desktop/Daten/masters_thesis/tRecX/tRecX/SCRIPTS/plot.py "$@"
}
COMPARE(){
    python ~/Desktop/Daten/masters_thesis/tRecX/tRecX/SCRIPTS/compare.py "$@"
}

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
