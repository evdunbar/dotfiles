# .bashrc


# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Add bash completion
#if [ -f /etc/bash_completion ]; then
#    . /etc/bash_completion
#fi


# Variables
export RANGER_LOAD_DEFAULT_RC='FALSE'
export GDK_SCALE=2
export SUDO_EDITOR="nvim"


# Functions
# Used in .bashrc
parse_git_branch () {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/  \1/'
}

parse_conda_env () {
    if [ -z "$CONDA_DEFAULT_ENV" ]
    then
        echo ""
    else
        echo "  $CONDA_DEFAULT_ENV"
    fi
}

# File management
mkdirgo () {
    mkdir -p $1 && cd $1
}

cl () {
    cd $1 && ls --color=auto
}

# Show unicode character
showuni () {
    echo -e "\u$1"
}


# Aliases
# File management
alias ls='ls --color=auto'
alias la='ls -a'
alias ll='ls -la'

# Package manager shortened commands
alias xn='sudo xbps-install -S'
alias xu='sudo xbps-install -Su'
alias xq='xbps-query -R --regex -s'
alias xr='sudo xbps-remove -R'

alias chckin='xbps-query -l | grep -e'

# Set the background 
alias setbg='feh --bg-fill'

# Miscellaneous
alias slack='slack-term'


# Change prompt
#PS1='[\u@\h \W]\$ '
#PS1=$"\[\033[0;32m\]\d:\t$ \[\033[0m\]"
PS1="\[\033[0;34m\]\[\033[0m\]\[\033[0;30;2;44m\] \W\[\033[0m\]\[\033[0;34;45m\]\[\033[0m\]\[\033[0;30;2;45m\]\$(parse_git_branch)\[\033[0m\]\[\033[0;35;43m\]\[\033[0m\]\[\033[0;30;2;43m\]\$(parse_conda_env)\[\033[0m\]\[\033[0;33;42m\]\[\033[0m\]\[\033[0;30;2;42m\] $\[\033[0m\]\[\033[0;32m\]\[\033[0m\] "
PS2="\[\033[0;32m\]\[\033[0m\] "


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/evan/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/evan/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/evan/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/evan/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

