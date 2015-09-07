# Check for activity.
[[ $- != *i* ]] && return
# Set the prompt look.
PS1='\d \t; \u \H \w; \$: '
# Set the defaults to Vim.
export EDITOR=vim
export MANPAGER=vim
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
alias s='sl'
alias sl='while true; do sl; done'
# CD:
alias -- -='cd -'
alias -- ~='cd ~'
alias .1='cd ..'
alias .2='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
alias .6='cd ../../../../../..'
# Vim:
alias v='vim'
alias vd='vimdiff'
# List:
alias l='ls --color=auto'
alias ls='ls --color=auto'
alias la='ls --color=auto -a'
alias ll='ls --color=auto -al'
alias lh='ls --color=auto -alh'
# Grep:
alias grep='grep --color=auto'
# Pacman:
alias pmi='sudo pacman -S @'
alias pmu='sudo pacman -Syyu'
alias aur='cd `mktemp -d` && bash <(curl meta.sh/aur) -si @'
