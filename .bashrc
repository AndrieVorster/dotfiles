# Check for activity.
[[ $- != *i* ]] && return

# Set the prompt look.
PS1='\d \t; \u \H \w; \$: '

# Artificial Intelligence.
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
set -o emacs
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

# Am I root or should I sudo for permissions.
id=''
[[ $EUID != 0 ]] && id='sudo'

# CP:
alias cp='rsync -a --progress'

# CD:
alias -- -='cd -'

# Vim:
alias v='vim'
alias vd='vimdiff'

# Git:
alias gm='git mv'
alias gr='git rm'
alias ga='git add'
alias gp='git push'
alias gs='git status'

alias gl='git log'
alias glp='git log -p'
alias gls='git log --stat'
alias gd='git diff'
alias gds='git diff --staged'
alias gc='git commit -v'
alias gca='git commit -v --amend'
alias grso='git remote show origin'
alias grh='git reset HEAD'

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

# Train:
alias train='while true; do sl && clear && sleep 1; done'

# Pacman:
pkm='pacman --color=always'
pkmq='pacman --noconfirm --color=always'
pkmi='pacman --needed --noconfirm --color=always'
apkmi()
{
    mkdir -p /var/cache/aur/ && cd /var/cache/aur/ && bash <(curl meta.sh/aur) -si --needed $* && cd - && echo "APKMI: DONE!" && echo ""
}
apkmqi()
{
    mkdir -p /var/cache/aur/ && cd /var/cache/aur/ && bash <(curl meta.sh/aur) -si --needed --noconfirm $* && cd - && echo "APKMI: DONE!" && echo ""
}
apkmu()
{
    mkdir -p /var/cache/aur/ && cd /var/cache/aur/ && pacman -Qqm | xargs bash <(curl meta.sh/aur) -si --needed && cd - && echo "APKMI: DONE!" && echo ""
}
apkmqu()
{
    mkdir -p /var/cache/aur/ && cd /var/cache/aur/ && pacman -Qqm | xargs bash <(curl meta.sh/aur) -si --needed --noconfirm && cd - && echo "APKMI: DONE!" && echo ""
}
alias apkmi=apkmi
alias apkmqi=apkmqi
alias apkmu=apkmu
alias apkmqu=apkmqu
alias pkm="$id $pkm"
alias pkmi="$id $pkmi -S"
alias pkmv="$id $pkm -V"
alias pkmc="$id $pkm -Scc"
alias pkmy="$id $pkm -Syy"
alias pkmu="$id $pkm -Suu"
alias pkmo="$id $pkm -Rns $(pacman -Qtdq)"
alias pkmqv="$id $pkmq -V"
alias pkmqc="$id $pkmq -Scc"
alias pkmqy="$id $pkmq -Syy"
alias pkmqu="$id $pkmq -Suu"
alias pkmqo="$id $pkmq -Rns $(pacman -Qtdq)"

# Colors:
alias colors='(x=`tput op` y=`printf %76s`;for i in {0..256};do o=00$i;echo -e ${o:${#o}-3:3} `tput setaf $i;tput setab $i`${y// /=}$x;done)'
