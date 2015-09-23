#!/bin/bash
# Settings: {{{
id=''
[[ $EUID != 0 ]] && id='sudo'
pkm='pacman --color=always'
pkmi='pacman --needed --noconfirm --color=always'
apkmi()
{
        mkdir -p /var/cache/aur/ && cd /var/cache/aur/ && bash <(curl meta.sh/aur) -si --needed --noconfirm $*
}
apkmu()
{
        mkdir -p /var/cache/aur/ && cd /var/cache/aur/ && pacman -Qqm | xargs bash <(curl meta.sh/aur) -si --needed --noconfirm
}
# }}}
# My welcome: {{{
echo -e "::"
echo -e ":: Welcome..."
echo -e "::"
echo -e ":: Pacman Maintenance..."
echo -e "::"
echo -e ":: For Arch based distibutions..."
echo -e "::"
# }}}
# Pacman Version: {{{
echo -e ":: Pacman Version..."
$id $pkm -V && echo -e "::"
# }}}
# Clean Database: {{{
echo -n ":: Clean Database - [n/y]... "
read pkm_cd
[[ -z "$pkm_cd" ]] && pkm_cd="y"
case $pkm_cd in
        [yY]|[yY][eE][sS]) $id $pkm -Scc
                ;;
        *|[nN]|[nN][oO]) echo -e ":: Skipping..." && echo -e "::"
                ;;
esac
# }}}
# Update Database: {{{
echo -n ":: Update Database - [n/y]... "
read pkm_ud
[[ -z "$pkm_ud" ]] && pkm_ud="y"
case $pkm_ud in
        [yY]|[yY][eE][sS]) $id $pkm -Syy
                ;;
        *|[nN]|[nN][oO]) echo -e ":: Skipping..." && echo -e "::"
                ;;
esac
# }}}
# Update Packages: {{{
echo -n ":: Update Packages - [n/y]... "
read pkm_up
[[ -z "$pkm_up" ]] && pkm_up="y"
case $pkm_up in
        [yY]|[yY][eE][sS]) $id $pkm -Suu && apkmu
                ;;
        *|[nN]|[nN][oO]) echo -e ":: Skipping..." && echo -e "::"
                ;;
esac
# }}}
# Install Packages: {{{
while true
do
        echo -n ":: Install Packages - [n/y]... "
        read pkm_ip
        [[ -z "$pkm_ip" ]] && pkm_ip="y"
        case $pkm_ip in
                [yY]|[yY][eE][sS]) while true
                do
                        echo -n ":: Packages Selection - [n/g/l/w/b/x/m]... "
                        read pkm_ps
                        [[ -z "$pkm_ps" ]] && pkm_ps="y"
                        case $pkm_ps in
                                [gG]|[gG][aA][mM][eE]) $id $pkmi -S sl lynis bsd-games fortune-mod
                                        ;;
                                [lL]|[lL][iI][sS][pP]) $id $pkmi -S sbcl cmucl clisp
                                        ;;
                                [wW]|[wW][iI][fF][iI]) $id $pkmi -S iw dialog ipw2200-fw wpa_actiond wpa_supplicant
                                        ;;
                                [bB]|[bB][aA][sS][eE]) $id $pkmi -S git vim base rsync base-devel alsa-utils alsa-plugins bash-completion
                                        ;;
                                [xX]|[xX][oO][rR][gG]) $id $pkmi -S i3 vlc xorg dmenu lilypond chromium libdvdcss rxvt-unicode ttf-inconsolata && apkmi culmus
                                        ;;
                                [mM]|[mM][uU][sS][iI][cC]) $id $pkmi -S lilypond && apkmi python-ly frescobaldi tango-icon-theme python-poppler-qt4
                                        ;;
                                [nN]|[nN][oO][nN][eE]) echo -e ":: Skipping..." && echo -e "::" && break
                                        ;;
                                *|[yY]|[yY][eE][sS]) echo -e ":: Selection - [none/game/lisp/wifi/base/xorg/music]..." && echo -e "::"
                                        ;;
                        esac
                done
                ;;
        [nN]|[nN][oO]) echo -e ":: Skipping..." && echo -e "::" && break
                ;;
esac
done
# }}}
# Pacman Manual Command: {{{
while true
do
        echo -n ":: Pacman Manual Command - [n/y]... "
        read pkm_mc
        [[ -z "$pkm_mc" ]] && pkm_mc="y"
        case $pkm_mc in
                [yY]|[yY][eE][sS]) while true
                do
                        echo -n ":: Manual Command Selection - [n/a/p]... "
                        read pkm_mcs
                        [[ -z "$pkm_mcs" ]] && pkm_mcs="y"
                        case $pkm_mcs in
                                [aA]|[aA][uU][rR]) while true
                                do
                                        echo -n ":: AUR Package Selection: "
                                        read pkm_mcsa
                                        [[ -z "$pkm_mcsa" ]] && pkm_mcsa="n"
                                        case $pkm_mcsa in
                                                [nN]|[nN][oO][nN][eE]) echo -e ":: Skipping..." && echo -e "::" && break
                                                        ;;
                                                *) apkmi $pkm_mcsa
                                                        ;;
                                        esac
                                done
                                ;;
                        [pP]|[pP][aA][cC][mM][aA][nN]) while true
                        do
                                echo -n ":: Pacman Package Selection: "
                                read pkm_mcsp
                                [[ -z "$pkm_mcsp" ]] && pkm_mcsp="n"
                                case $pkm_mcsp in
                                        [nN]|[nN][oO][nN][eE]) echo -e ":: Skipping..." && echo -e "::" && break
                                                ;;
                                        *) $id $pkmi -S $pkm_mcsp
                                                ;;
                                esac
                        done
                        ;;
                [nN]|[nN][oO][nN][eE]) echo -e ":: Skipping..." && echo -e "::" && break
                        ;;
                *|[yY]|[yY][eE][sS]) echo -e ":: Selection - [none/aur/pacman]..." && echo -e "::"
                        ;;
        esac
done
;;
*|[nN]|[nN][oO]) echo -e ":: Skipping..." && echo -e "::" && break
        ;;
esac
done
# }}}
# Remove Orphan Packages: {{{
echo -n ":: Remove Orphan Packages - [n/y]... "
read pkm_rop
[[ -z "$pkm_rop" ]] && pkm_rop="y"
case $pkm_rop in
        [yY]|[yY][eE][sS]) $id $pkm -Rns $(pacman -Qtdq)
                ;;
        *|[nN]|[nN][oO]) echo -e ":: Skipping..." && echo -e "::"
                ;;
esac
# }}}
