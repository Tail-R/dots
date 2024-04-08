#! /usr/bin/env bash

# dependencies: dmenu

font='azukifontB-16-Bold'
monitor=0

nf='#884444'
nb='#ffffff'
sf='#884444'
sb='#ffcccc'

# nf='#aa0000'
# nb='#ffffdd'
# sf='#aa0000'
# sb='#ffcccc'

dmenu_run -fn $font -m $monitor -nb $nb -nf $nf -sb $sb -sf $sf
