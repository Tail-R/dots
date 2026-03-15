#
# Utility functions
#
try_source() {
    [ -f $1 ] && source $1
}

try_cd() {
    [ -d $1 ] && cd $1
}

#
# Environment variabless
#
export EDITOR=vim
export BROWSER=firefox

#
# Extend PATH
#
export PATH=$PATH:$HOME/.local/bin

#
# History
#
export HISTSIZE=5000
export HISTIGNORE="ls"

#
# Set terminal flag
#
case $TERM in
    rxvt*|xterm*) IS_RXVT=1 ;;
    *) unset IS_RXVT ;;
esac

#
# Dynamic title
#
if [ -v IS_RXVT ]; then
    trap 'printf "\033]0;${BASH_COMMAND%% *}\007"' DEBUG
fi

#
# Prompt
#
precmd() {
    if [ -v IS_RXVT ]; then
        printf "\033]0;Term\007"
    fi

    PS1="\n\[\033[0;35m\] \w \[\033[0;37m\]$ \[\033[0m\]"
}

export PROMPT_DIRTRIM=3
export PROMPT_COMMAND=precmd

#
# Aliases
#
alias v='vim'
alias r='ranger'
alias zat='zathura'

alias c='clear'
alias e='exit'
alias ls='ls --color=auto'
alias l='ls -l --color=auto'
alias la='ls -la --color=auto'
alias t='tree -C'

# Pacman aliases
alias update='sudo pacman -Syu'
alias lspkgs='pacman -Q'
alias install='sudo pacman -S'
alias remove='sudo pacman -Rs'

# Git aliases
alias gi='git init'
alias gs='git status'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias dot='git --git-dir=$HOME/.dots --work-tree=$HOME'

# Meson aliases
alias ms='meson setup build'
alias mc='meson compile -C build'

alias xmrg='xrdb merge ~/.Xresources'

# Openbox aliases
alias rc.xml='vim ~/.config/openbox/rc.xml'
alias menu.xml='vim ~/.config/openbox/menu.xml'
alias autostart='vim ~/.config/openbox/autostart'

#
# Useful commands
#
rice() {
    try_cd ~/.config

    [ "$1" != "" ] && try_cd $1
}

coffee() {
    try_cd ~/workspace

    [ "$1" != "" ] && try_cd $1
}

