# File: ~/.xinitrc
# Info: Run these when xinit starts up.

# Use the ~/.Xresources file. (urxvt and xterm need this.
# NOTE: You can only use SINGLE bracket tests for tests. ~/.Xresources will not load if it is a double set.
[ -f ~/.Xresources ] && xrdb -merge ~/.Xresources
# Consider adding stuff piecewise in the directory `/xresources.d/`

# Start i3 as the desktop manager
exec i3
