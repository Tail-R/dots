#! /usr/bin/env bash

pkgs="
vim
helix
yazi
unzip
openbox
tint2
alacritty
sxiv
feh
mpd
ncmpcpp
mpv
firefox
gimp
nemo
nemo-fileroller
brightnessctl
pamixer
dunst
dmenu
"

echo $pkgs | while read -r pkg; do
    sudo pacman -S $pkg
done
