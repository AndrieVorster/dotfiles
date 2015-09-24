#!/bin/bash
# Welcome:
echo -e "Dotfiles link script..."
dotdirectory="$(dirname "$(readlink -f "$0")")"
# Dotfiles:
echo -e "Linking from:"
echo -e "$dotdirectory"
# X...
ln -fsv ${dotdirectory}/.xinitrc $HOME/.xinitrc
ln -fsv ${dotdirectory}/.Xmodmap $HOME/.Xmodmap
ln -fsv ${dotdirectory}/.Xresources $HOME/.Xresources
# i3...
ln -fnsv ${dotdirectory}/.i3/ $HOME/.i3
# Vim...
ln -fsv ${dotdirectory}/.vimrc $HOME/.vimrc
# Git...
ln -fsv ${dotdirectory}/.gitconfig $HOME/.gitconfig
# Bash...
ln -fsv ${dotdirectory}/.bashrc $HOME/.bashrc
ln -fsv ${dotdirectory}/.profile $HOME/.profile
# !...
mkdir -p $HOME/bin/
# Setup...
ln -fsv ${dotdirectory}/setup.sh $HOME/bin/mysetup
# Pacman...
ln -fsv ${dotdirectory}/pacman.sh $HOME/bin/mypacman
# URxvt...
ln -fnsv ${dotdirectory}/.urxvt/ $HOME/.urxvt
# URxvt Font:
if [ -f ${dotdirectory}/.urxvt/ext/font-size ]; then echo -e "URxvt Font already exist..."; else curl -fLo ${dotdirectory}/.urxvt/ext/font-size --create-dirs https://raw.githubusercontent.com/majutsushi/urxvt-font-size/master/font-size; fi
