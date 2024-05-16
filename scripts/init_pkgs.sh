#! /usr/bin/env bash

pkgs="
helix
yazi
unzip
hyprland
hyprpaper
alacritty
wofi
feh
mpv
mpd
ncmpcpp
firefox
fcitx5
fcitx5-im
fcitx5-mozc
gimp
nemo
nemo-fileroller
brightnessctl
pamixer
dunst
"

echo $pkgs | while read -r pkg; do
    sudo pacman -S $pkg
done
