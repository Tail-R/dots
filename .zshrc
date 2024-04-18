try_source() {
    [ -f $1 ] && source $1
}

try_cd() {
    [ -d $1 ] && cd $1
}

try_source $HOME/.cargo/env
try_source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Set title for specific terminal
case $TERM in
xterm*|rxvt*) print -Pn "\e]0;たーみなる\a"
;;
esac

export EDITOR=vim
export BROWSER=firefox

#
# Extend PATH
#
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/scripts

#
# Options
#
setopt AUTO_CD
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

#
# History
#
HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000

#
# Prompt
#

# Precmd() is a special function to redraw the prompt
precmd() {
    if [[ $? == 0 ]]; then
        estat=$(pad green)
    else
        estat=$(pad red)
    fi

    if [[ $TERM != 'linux' ]]; then
        cdir=$(bold $(ch_bg cyan $(ch_fg black $(get_cdir))))
        
        PS1=$'\n'
        PS1+="$estat$(pad cyan)$cdir$(pad cyan) "
    else
        # Simple prompt for tty
        PS1=$'\n'
        PS1+="$USER@$HOST %~ %# "
    fi
}

get_cdir() {
    hsym='～'
    # hsym='HOME'
    
    if [[ $PWD != $HOME ]]; then
        echo "%c" 
    else
        echo $hsym
    fi
}

get_date() {
    date +'%H:%M'
}

ch_fg() {
    echo "%F{$1}$2%f"
}

ch_bg() {
    echo "%K{$1}$2%k"
}

bold() {
    echo "%B$1%b"
}

pad() {
    echo "$(ch_bg $1 ' ')"
}

#
# Aliases
#
alias update='sudo pacman -Syu'
alias lspkgs='pacman -Q'
alias install='sudo pacman -S'
alias remove='sudo pacman -Rs'

alias c='clear'
alias ls='ls --color=auto'
alias l='ls -l --color=auto'
alias la='ls -la --color=auto'
alias t='tree -C'

alias gs='git status'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'

alias v='vim'
alias r='yazi'
alias xmrg='xrdb merge ~/.Xresources'

alias xres='vim ~/.Xresources'
alias vimrc='vim ~/.vimrc'
alias zshrc='vim ~/.zshrc'

alias rc.xml='vim ~/.config/openbox/rc.xml'
alias menu.xml='vim ~/.config/openbox/menu.xml'
alias autostart='vim ~/.config/openbox/autostart'

alias dots='try_cd ~/dots'
alias rice='try_cd ~/.config'
alias coffee='try_cd ~/Documents/workspaces'
alias walls='try_cd ~/Pictures/wallpapers'

alias ncmp='ncmpcpp'
alias zat='zathura'

alias cr='cargo run'
alias cb='cargo build'

#
# Custom commands
#
gg() {
    xdg-open "https://www.google.com/search?q=$1"
}

socks() {
    echo -e "\e[0m"

    for ((i = 0; i <= 7; i++)); do
        echo -e "\e[1;4${i}m    \e[0m    \e[1;10${i}m    "
    done

    echo -e "\e[0m"
}
