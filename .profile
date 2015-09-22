# Bash...

# PATH...
# Before:
#export PATH=$PATH:$HOME/bin
# After:
export PATH=$HOME/bin:$PATH
[[ -f ~/.bashrc ]] && . ~/.bashrc
# Laptop...
[[ $(whoami) = "apie" && $(tty) = "/dev/tty1" ]] && exec startx
[[ $(whoami) = "apie" && $(tty) = "/dev/tty2" ]] && exec startx
[[ $(whoami) = "apie" && $(tty) = "/dev/tty3" ]] && exec startx
[[ $(whoami) = "apie" && $(tty) = "/dev/tty4" ]] && exec startx
[[ $(whoami) = "apie" && $(tty) = "/dev/tty5" ]] && exec startx
[[ $(whoami) = "apie" && $(tty) = "/dev/tty6" ]] && exec startx
# Desktop...
[[ $(whoami) = "andrie" && $(tty) = "/dev/tty1" ]] && exec startx
[[ $(whoami) = "andrie" && $(tty) = "/dev/tty2" ]] && exec startx
[[ $(whoami) = "andrie" && $(tty) = "/dev/tty3" ]] && exec startx
[[ $(whoami) = "andrie" && $(tty) = "/dev/tty4" ]] && exec startx
[[ $(whoami) = "andrie" && $(tty) = "/dev/tty5" ]] && exec startx
[[ $(whoami) = "andrie" && $(tty) = "/dev/tty6" ]] && exec startx
