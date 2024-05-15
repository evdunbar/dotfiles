# .bash_profile

# Get the aliases and functions
[ -f $HOME/.bashrc ] && . $HOME/.bashrc

# Autostart graphical interface at login
if [[ -z $DISPLAY ]] ; then
    if [[ $(tty) = /dev/tty1 ]] ; then
        exec dbus-run-session Hyprland
    elif [[ $(tty) = /dev/tty2 ]] ; then
        startx
    fi
fi

# Add zsh-like pre cmd hooks
source $HOME/Code/os/bash_preexec.sh
source $HOME/Code/os/shell_integration.bash
