#!/bin/bash

echo -e "Dotfiles link script..."
dotdirectory="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd )"

# X:
ln -sf ${dotdirectory}/.xrc $HOME/.xrc
ln -sf ${dotdirectory}/.xinitrc $HOME/.xinitrc
# i3:
ln -sf ${dotdirectory}/.i3/ $HOME/.i3
# Vim:
ln -sf ${dotdirectory}/.vimrc $HOME/.vimrc
# Git:
ln -sf ${dotdirectory}/.gitconfig $HOME/.gitconfig
# Bash:
ln -sf ${dotdirectory}/.bashrc $HOME/.bashrc
ln -sf ${dotdirectory}/.profile $HOME/.profile
# Bin:
mkdir -p $HOME/bin/
# Setup:
ln -sf ${dotdirectory}/bin/setup.sh $HOME/bin/setup.sh
# Pacman:
ln -sf ${dotdirectory}/bin/pacman.sh $HOME/bin/pacman.sh
