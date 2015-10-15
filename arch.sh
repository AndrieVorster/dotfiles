#!/bin/bash
# Setup {{{
id=''
[[ $EUID != 0 ]] && id='sudo'
# }}}
# Welcome {{{
echo -e ""
echo -e "Arch Linux Setup"
echo -e ""
# }}}
# Internet {{{
ip link
echo -n "Enter the WIFI device name: "
read a_wip
[[ -z "$a_wip" ]] && a_wip="!"
case $a_wip in
    [!]) echo -e "Skipping"
        ;;
    *) $id wifi-menu -o $a_wip
        ;;
esac
echo -e ""
ip link
echo -n "Enter the DHCPCD device name: "
read a_dip
[[ -z "$a_dip" ]] && a_dip="!"
case $a_dip in
    [!]) echo -e "Skipping"
        ;;
    *) $id systemctl start dhcpcd@$a_dip.service
        ;;
esac
echo -e ""
# }}}
# Time {{{
timedatectl status
echo -e ""
timedatectl set-ntp true
echo -e ""
timedatectl status
echo -e ""
# }}}
