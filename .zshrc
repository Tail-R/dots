try_source() {
    [ -f $1 ] && source $1
}

try_cd() {
    [ -d $1 ] && cd $1
}

# Extend PATH
export PATH=$PATH:~/.local/bin
export PATH=$PATH:~/scripts

try_source ~/.cargo/env
try_source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

export EDITOR=vim
export BROWSER=firefox

# options
setopt AUTO_CD

# history
HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000

# prompt
PS1=$'\n'
PS1+="%B%2~ %# %b"

# aliases
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
alias obas='vim ~/.config/openbox/autostart'

alias dots='try_cd ~/dots'
alias rice='try_cd ~/.config'
alias coffee='try_cd ~/Documents/workspaces'
alias walls='try_cd ~/Pictures/wallpapers'

alias fet='neofetch'
alias ncmp='ncmpcpp'

# custom commands
gg() {
    xdg-open "https://www.google.com/search?q=$1"
}

bg() {
    if [[ "$(command -v feh)" !=  "" && -f ./$2 ]]; then
        feh "--bg-$1" ./$2
    else
        echo "invalid file path"
    fi
}
