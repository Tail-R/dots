#! /usr/bin/env bash

# dependencies: maim, xrandr, dunst

SSDIR=$HOME/Pictures/screenshot
TYPE='png'
Q=10 # quality: 1 ~ 10

mkdir -p $HOME/Pictures
mkdir -p $SSDIR

name=$(date "+%Y%m%d_%H%M%S.$TYPE")

case "$1" in
-s)
    maim -u -m $Q -s $SSDIR/$name

    if [[ ! $? ]]; then
    notify-send -i $SSDIR/$name "Taking a screenshot!
saved to $name"
    else
        notify-send "Screenshot has been aborted!"
    fi
;;
-f)
    maim -u -m $Q $SSDIR/$name
    notify-send -i $SSDIR/$name "Taking a screenshot!
saved to $name"
;;
-p)
    geo=$(xrandr | grep primary | cut -d ' ' -f4)
    maim -g $geo -u -m $Q $SSDIR/$name
    notify-send -i $SSDIR/$name "Taking a screenshot!
saved to $name"
;;
-c)
    [[ $(ls $SSDIR) ]] && rm $SSDIR/*
    notify-send "Screenshot directory is empty"
;;
esac
