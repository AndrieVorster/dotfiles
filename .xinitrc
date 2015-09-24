[[ -f $HOME/.Xresources ]] && xrdb $HOME/.Xresources
[[ -f $HOME/.Xmodmap ]] && xmodmap $HOME/.Xmodmap
exec i3
