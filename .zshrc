# source $HOME/.cargo/env

export EDITOR=vim
export PATH=$PATH:~/.local/bin
export PATH=$PATH:~/scripts

# prompt
PS1="%B%5~ %# %b"

# aliases
alias c='clear'
alias ls='ls --color=auto'
alias l='ls -l --color=auto'
alias la='ls -la --color=auto'

alias v='vim'
alias r='yazi'
alias xmrg='xrdb merge ~/.Xresources'

alias rice='[[ -d ~/.config ]] && cd ~/.config'
alias coffee='[[ -d ~/Documents/workspaces ]] && cd ~/Documents/workspaces'

alias fet='neofetch'
alias ncmp='ncmpcpp'

# history
HISTFILE=~/.zsh_history
SAVEHIST=5000

# command
gg() {
    xdg-open "https://www.google.com/search?q=$1"
}
