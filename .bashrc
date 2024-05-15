# .bashrc


# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# vi keybindings
set -o vi

# Add bash completion
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion


# Variables
. $HOME/Code/os/xdg_exports.sh
export SUDO_EDITOR="nvim"
export EDITOR="nvim"
export PATH=$HOME/.local/bin:$PATH
export PATH=$XDG_DATA_HOME/cargo/bin:$PATH
export LIBVA_DRIVER_NAME="i965"
export npm_config_prefix="$HOME/.local"


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
mkcdir () {
    mkdir -p $1 && cd $1
}

cl () {
    cd $1 && eza
}

backup () {
    cp $1 $1.bak
}

# Show unicode character
showuni () {
    echo -e "\u$1"
}

# Micromamba installation
umn () {
    micromamba install $@ -c conda-forge
}

# Others
topdf () {
    pandoc -V geometry:margin=1in -i $1.$2 -o $1.pdf
}


# Aliases
# File management
alias ls="eza"
alias la="eza -A"
alias ll="eza -lAh"

# Package manager shortened commands
alias pn="sudo pacman -Sy"
alias pu="sudo pacman -Syu"
alias pq="pacman -Ss"
alias pr="sudo pacman -Rs"
alias pf="pacman -F"

alias pui="pip install --user --break-system-packages"
alias um="micromamba"
alias uma="micromamba activate"
alias umd="micromamba deactivate"

# Miscellaneous
alias classtime="cd $HOME/Documents && nvim"
alias alldone="cd && micromamba deactivate && clear"
alias acli="arduino-cli"
alias nm-scan="nmcli device wifi list 1> /dev/null"
alias neofetch="fastfetch -c neofetch.jsonc"


# Change prompt
if [[ -z $DISPLAY ]] ; then
    PS1="\[\033[92m\][\h] \[\033[0m\]\W \[\033[33m\]\$ \[\033[0m\]"
    PS2="\[\033[32m\]> "
else
    PS1="\[\033[94m\]\[\033[0m\]\[\033[30;104m\] \W\[\033[0m\]\[\033[94;105m\]\[\033[0m\]\[\033[30;105m\]\$(parse_git_branch)\[\033[0m\]\[\033[95;103m\]\[\033[0m\]\[\033[30;103m\]\$(parse_conda_env)\[\033[0m\]\[\033[93;102m\]\[\033[0m\]\[\033[30;102m\] \$\[\033[0m\]\[\033[92m\]\[\033[0m\] "
    PS2="\[\033[0;92m\]\[\033[0m\] "
fi


# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
export MAMBA_EXE='/home/evan/.local/bin/micromamba';
export MAMBA_ROOT_PREFIX='/home/evan/Code/micromamba';
__mamba_setup="$("$MAMBA_EXE" shell hook --shell bash --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias micromamba="$MAMBA_EXE"  # Fallback on help from mamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<
