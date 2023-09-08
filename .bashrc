# .bashrc


# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Add bash completion
#if [ -f /etc/bash_completion ]; then
#    . /etc/bash_completion
#fi

# Pywal enable
(cat ~/.cache/wal/sequences &)
source ~/.cache/wal/colors-tty.sh

# Variables
export RANGER_LOAD_DEFAULT_RC='FALSE'
export GDK_SCALE=2
export SUDO_EDITOR="nvim"
export EDITOR="nvim"
export XDG_CONFIG_HOME="$HOME/.config"
export PATH=/home/evan/.local/bin:$PATH
export PATH=/home/evan/.cargo/bin:$PATH


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
    cd $1 && ls --color=auto
}

backup () {
    cp $1 $1.bak
}

mvdl () {
    mv ~/Downloads/$1 .
}

# Show unicode character
showuni () {
    echo -e "\u$1"
}

# Micromamba installation
umn () {
    micromamba install $@ -c conda-forge
}

md2pdf () {
    pandoc -V geometry:margin=1in -i $1.md -o $1.pdf
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
alias xo='sudo xbps-remove -Oo'

alias tn='sudo tlmgr install'
alias tq='tlmgr search --global'

alias chckin='xbps-query -l | grep -e'

# Set the background 
alias setbg='feh --bg-fill'

# Miscellaneous
alias slack='slack-term'
alias classtime='cd ~/Documents && nvim'
alias alldone='cd && clear'
alias disas="objdump -drwCS -Mintel"
alias um="micromamba"
alias zath='~/.local/bin/zathura'


# Change prompt
PS1="\[\033[0;94m\]\[\033[0m\]\[\033[0;90;2;104m\] \W\[\033[0m\]\[\033[0;94;105m\]\[\033[0m\]\[\033[0;90;2;105m\]\$(parse_git_branch)\[\033[0m\]\[\033[0;95;103m\]\[\033[0m\]\[\033[0;90;2;103m\]\$(parse_conda_env)\[\033[0m\]\[\033[0;93;102m\]\[\033[0m\]\[\033[0;90;2;102m\] \$\[\033[0m\]\[\033[0;92m\]\[\033[0m\] "
PS2="\[\033[0;92m\]\[\033[0m\] "

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
export MAMBA_EXE="/home/evan/.local/bin/micromamba";
export MAMBA_ROOT_PREFIX="/home/evan/micromamba";
__mamba_setup="$("$MAMBA_EXE" shell hook --shell bash --prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    if [ -f "/home/evan/micromamba/etc/profile.d/micromamba.sh" ]; then
        . "/home/evan/micromamba/etc/profile.d/micromamba.sh"
    else
        export  PATH="/home/evan/micromamba/bin:$PATH"  # extra space after export prevents interference from conda init
    fi
fi
unset __mamba_setup
# <<< mamba initialize <<<

