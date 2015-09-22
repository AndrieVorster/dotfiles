# Bash...

# BashRC...
[[ -f $HOME/.bashrc ]] && source $HOME/.bashrc
# User PATH...
[[ -d $HOME/bin/ ]] && export PATH=$HOME/bin/:$PATH
#[[ -d $HOME/bin/ ]] && export PATH=$PATH:$HOME/bin/
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
