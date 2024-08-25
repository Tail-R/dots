#! /usr/bin/env bash

pkgs="
openbox
vim
helix
yazi
unzip
alacritty
xterm
rxvt-unicode
dmenu
rofi
geany
feh
mpv
ncmpcpp
firefox
fcitx5
fcitx5-im
fcitx5-mozc
nemo
nemo-fileroller
pamixer
brightnessctl
xdotool
xclip
gimp
obs-studio
"

echo $pkgs | while read -r pkg; do
    sudo pacman -S $pkg
done
