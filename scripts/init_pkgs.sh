#! /usr/bin/env bash

pkgs="
vim
yazi
unzip
openbox
alacritty
feh
mpv
firefox
gimp
nemo
nemo-fileroller
brightnessctl
pamixer
dunst
dmenu
xclip
inotify-tools
"

echo $pkgs | while read -r pkg; do
    sudo pacman -S $pkg
done
