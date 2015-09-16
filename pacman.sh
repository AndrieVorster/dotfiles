#!/bin/bash
echo -e "::"
# Settings:
id=''
if (( $EUID != 0 )); then
        id='sudo'
fi
pm='pacman --color=always'

# My welcome:
echo -e ":: Pacman Maintenance..."
echo -e ":: For Arch based distibutions..."
echo -e "::"

# The script:
echo -e ":: Cleaning database..."
$id $pm -Scc
echo -e "::"

echo -e ":: Updating database..."
$id $pm -Syy
echo -e "::"

echo -e ":: Updating packages..."
$id $pm -Suu
echo -e "::"

echo -e ":: Installing packages..."
$id $pm -S base base-devel
$id $pm -S git vim rxvt-unicode
$id $pm -S i3 xorg dmenu chromium
$id $pm -S alsa alsa-utils alsa-plugins
echo -e "::"

echo -e ":: Purging orphaned packages..."
$id $pm -Rns $(pacman -Qtdq)
echo -e "::"
