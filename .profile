[[ -f ~/.bashrc ]] && . ~/.bashrc
[[ $(whoami) = "apie" && $(tty) = "/dev/tty1" ]] && exec startx
[[ $(whoami) = "apie" && $(tty) = "/dev/tty2" ]] && exec startx
[[ $(whoami) = "apie" && $(tty) = "/dev/tty3" ]] && exec startx
[[ $(whoami) = "apie" && $(tty) = "/dev/tty4" ]] && exec startx
[[ $(whoami) = "apie" && $(tty) = "/dev/tty5" ]] && exec startx
[[ $(whoami) = "apie" && $(tty) = "/dev/tty6" ]] && exec startx
