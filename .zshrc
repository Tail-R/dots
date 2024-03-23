try_source() {
    [ -f $1 ] && source $1
}

try_cd() {
    [ -d $1 ] && cd $1
}

#
# Extend PATH
#
export PATH=$PATH:~/.local/bin
export PATH=$PATH:~/scripts

try_source ~/.cargo/env
try_source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

export EDITOR=vim
export BROWSER=firefox

#
# options
#
setopt AUTO_CD
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

#
# history
#
HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000

#
# prompt
#

# precmd() is a special function to redraw the prompt
precmd() {
    if [[ $? == 0 ]]; then
        estat=$(pad blue)
    else
        estat=$(pad black)
    fi

    # hsym='HOME'
    # hsym='いえ'
    # hsym='★ '
    hsym='～'
    cdir=$(ch_fg black "$hsym$(get_cdir)")
    cdir=$(ch_bg yellow $cdir)
    
    PS1=$'\n'
    PS1+="$estat$(pad yellow)$cdir$(pad yellow) "
}

get_cdir() {
    if [[ $PWD != $HOME ]]; then
        echo "$PWD" | sed -e 's/\/home\/tailr//g'
    fi
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
# aliases
#
alias c='clear'
alias ls='ls --color=auto'
alias l='ls -l --color=auto'
alias la='ls -la --color=auto'

alias v='vim'
alias r='yazi'
alias xmrg='xrdb merge ~/.Xresources'

alias xres='vim ~/.Xresources'
alias vimrc='vim ~/.vimrc'
alias zshrc='vim ~/.zshrc'

alias rc.xml='vim ~/.config/openbox/rc.xml'
alias menu.xml='vim ~/.config/openbox/menu.xml'
alias autostart='vim ~/.config/openbox/autostart'
alias tint2rc='vim ~/.config/tint2/tint2rc'

alias dots='try_cd ~/dots'
alias rice='try_cd ~/.config'
alias coffee='try_cd ~/Documents/workspaces'
alias walls='try_cd ~/Pictures/wallpapers'

alias fet='neofetch'
alias ncmp='ncmpcpp'

#
# custom commands
#
gg() {
    xdg-open "https://www.google.com/search?q=$1"
}

cols() {
    for ((i = 30; i <= 37; i++)); do
        echo -e "\033[1;${i}mあいうえお"
    done
    
    for ((i = 90; i <= 97; i++)); do
        echo -e "\033[1;${i}mアイウエオ"
    done
}
