# Check for activity.
[[ $- != *i* ]] && return

# Set the prompt look.
PS1='\d \t; \u \H \w; \$: '

# Set the defaults to Vim.
export EDITOR=vim

# GCC does support colors.
export GCC_COLORS=1

# Shopt some basic settings.
shopt -s autocd
shopt -s cdspell
shopt -s checkwinsize

# This should be standard in bash.
complete -cf man
complete -cf sudo

# Don't save duplicates in history.
HISTCONTROL=ignoreboth

# All aliases.
alias sl...='while true; do sl && clear && sleep 1; done'

# CP:
alias cp='rsync -a --progress'

# CD:
alias -- -='cd -'
alias -- ~='cd ~'

# Vim:
alias v='vim'
alias vd='vimdiff'

# Git:
alias ga='git add --all'
alias gm='git commit -m "..."'
alias gp='git push -u origin master'

# Perl:
alias p='perl'

# Lisp:
alias l1='sbcl'
alias l2='clisp'

# List:
alias l='ls --color=always'
alias ls='ls --color=always'
alias la='ls --color=always -a'
alias ll='ls --color=always -al'
alias lh='ls --color=always -alh'

# Grep:
alias grep='grep --color=auto'

# Ping:
alias wifi='ping -c7 www.google.com'

# Cheers:
alias rb='sudo reboot'
alias po='sudo poweroff'

# Pacman:
alias pacman='sudo pacman --color=always'
alias aur-pacman='cd `mktemp -d` && bash <(curl meta.sh/aur) -si'
