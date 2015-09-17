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
# Add...
alias ga='git add'
# Log...
alias gl='git log'
alias glp='git log -p'
alias gls='git log --stat'
alias glo='git log --oneline'
alias glod='git log --oneline --decorate'
# Move...
alias gm='git mv'
# Push...
alias gp='git push'
alias gpom='git push -u origin master'
# Diff...
alias gd='git diff'
alias gds='git diff --staged'
# Delete...
alias gr='git rm'
# Status...
alias gs='git status'
# Commit...
alias gc='git commit -v'
alias gca='git commit -v --amend'
# Remote...
alias grso='git remote show origin'

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
alias pkm='sudo pacman --color=always'
alias pkmro='sudo pacman --color=always -Rns $(pacman -Qtdq)'
alias aurget='cd ~/aur/ && bash <(curl meta.sh/aur) -si'
alias aursync='cd ~/aur/ && pacman -Qqm | xargs bash <(curl meta.sh/aur) -si --needed'

# Colors:
alias colors='(x=`tput op` y=`printf %76s`;for i in {0..256};do o=00$i;echo -e ${o:${#o}-3:3} `tput setaf $i;tput setab $i`${y// /=}$x;done)'
