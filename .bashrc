# Check for activity.
[[ $- != *i* ]] && return

# Set the prompt look.
PS1='\d \t; \u \H \w; \$: '

# Fortune cheers you up!
#echo -e ""
#fortune -s
#echo -e ""

# Artificial Intelligence!
echo -e ""
echo -e "Q:  How did you get into artificial intelligence?"
echo -e "A:  Seemed logical -- I didn't have any real intelligence."
echo -e ""
echo -e "Running Windows on a Pentium is like having a brand new Porsche but only
be able to drive backwards with the handbrake on."
echo -e ""

# I don't want coredumps.
ulimit -S -c 0

# Set the defaults to Vim.
export EDITOR=vim

# GCC does support colors.
export GCC_COLORS=1

# Shopt some basic settings.
shopt -s autocd
shopt -s extglob
shopt -s cdspell
shopt -s checkhash
shopt -s nocaseglob
shopt -s checkwinsize
shopt -s no_empty_cmd_completion

# This should be standard in bash.
complete -cf man
complete -cf sudo

# I have customized history settings.
HISTCONTROL=ignoreboth
export HISTFILE=$HOME/.history

# All aliases.
alias train='while true; do sl && clear && sleep 1; done'

# CP:
alias cp='rsync -a --progress'

# CD:
alias -- -='cd -'
alias -- ~='cd ~'

# Vim:
alias v='vim'
alias vd='vimdiff'

# Perl:
alias p='perl'

# Lisp:
alias l1='sbcl'
alias l2='clisp'
alias l3='cmucl'

# List:
alias l='ls --color=always'
alias ls='ls --color=always'
alias la='ls --color=always -a'
alias ll='ls --color=always -al'
alias lh='ls --color=always -alh'

# Grep:
alias grep='grep --color=auto'

# Ping:
alias ping='ping -c7 www.google.com'

# MkDir:
alias mkdir="mkdir -p"
# Cheers:
alias rb='sudo reboot'
alias po='sudo poweroff'

# Colors:
alias colors='(x=`tput op` y=`printf %76s`;for i in {0..256};do o=00$i;echo -e ${o:${#o}-3:3} `tput setaf $i;tput setab $i`${y// /=}$x;done)'
