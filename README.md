# About this setup

Git repo for dotfiles in ~/.dotfiles instead of ~/.git

See https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/

Summary to restore:

1. Set up alias
2. Add .dotfiles to ~/.gitignore
3. git clone --bare <REPO> ~/.dotfiles
4. dotfiles checkout (maybe backup some files first)


# Requirements

    oh-my-zsh: https://github.com/robbyrussell/oh-my-zsh
    oh-my-git: https://github.com/arialdomartini/oh-my-git
    z: https://github.com/rupa/z


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
