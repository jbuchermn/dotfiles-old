# dotfiles repo
function dotfiles {
   git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}

dotfiles config --local status.showUntrackedFiles no

# Configurations
source $SHELL_DIR/z/z.sh
source $SHELL_DIR/env.sh
source $SHELL_DIR/convenience.sh

