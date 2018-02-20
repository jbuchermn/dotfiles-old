# About this setup

Git repo for dotfiles in [~/.dotfiles instead of ~/.git](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/)

Summary to restore:

```bash
cd
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
echo '.dotfiles' >> .gitignore
git clone --bare https://github.com/jbuchermn/dotfiles $HOME/.dotfiles
rm .gitignore
dotfiles checkout
```


# Requirements/Submodules

1. [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
2. [spaceship-prompt](https://github.com/denysdovhan/spaceship-prompt)
3. [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
4. [z](https://github.com/rupa/z)
5. [spacemacs](https://github.com/syl20bnr/spacemacs)
6. [Powerline](https://github.com/powerline/fonts)

# Enable shell configuration

Zsh configuration enabled by default (.zshrc included). Configuration for
Bash must be added to .bash_profile (on macOS) or .bashrc (on Linux):

```bash
export SHELL_DIR=~/.shell
source $SHELL_DIR/bash.sh
```


# True color support in Emacs

Version should be something like 26, 27, ... (25.3 did NOT work), start emacs with TERM=xterm-24bit emacs -nw

File install_terminfo_iterm2.sh

    #!/bin/bash
    tic -x -o ~/.terminfo install_terminfo_iterm2.src

File install_terminfo_iterm2.src

    # Use colon separators.
    xterm-24bit|xterm with 24-bit direct color mode,
       use=xterm-256color,
       setb24=\E[48:2:%p1%{65536}%/%d:%p1%{256}%/%{255}%&%d:%p1%{255}%&%dm,
       setf24=\E[38:2:%p1%{65536}%/%d:%p1%{256}%/%{255}%&%d:%p1%{255}%&%dm,
    # Use semicolon separators.
    xterm-24bits|xterm with 24-bit direct color mode,
       use=xterm-256color,
       setb24=\E[48;2;%p1%{65536}%/%d;%p1%{256}%/%{255}%&%d;%p1%{255}%&%dm,
       setf24=\E[38;2;%p1%{65536}%/%d;%p1%{256}%/%{255}%&%d;%p1%{255}%&%dm,
