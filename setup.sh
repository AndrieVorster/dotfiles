#!/bin/bash

# Welcome:
echo -e "Dotfiles link script..."
dotdirectory="$(dirname "$(readlink -f "$0")")"

# Dotfiles:
echo -e "Linking from:"
echo -e "$dotdirectory"

# X:
ln -fsv ${dotdirectory}/.xrc $HOME/.xrc
ln -fsv ${dotdirectory}/.xinitrc $HOME/.xinitrc
# i3:
ln -fnsv ${dotdirectory}/.i3/ $HOME/.i3
# Vim:
ln -fsv ${dotdirectory}/.vimrc $HOME/.vimrc
# Git:
ln -fsv ${dotdirectory}/.gitconfig $HOME/.gitconfig
# Bash:
ln -fsv ${dotdirectory}/.bashrc $HOME/.bashrc
ln -fsv ${dotdirectory}/.profile $HOME/.profile
# !:
mkdir -p $HOME/bin/
# Setup:
ln -fsv ${dotdirectory}/setup.sh $HOME/bin/matsetup
# Pacman:
ln -fsv ${dotdirectory}/pacman.sh $HOME/bin/matpacman
