#! /usr/bin/env bash

font='NotoSansMono-16-Bold'
monitor=-1

# nf='#242927'
# nb='#ffffff'
# sf='#0366d6'
# sb='#d1d5da'

nf='#d1d5da'
nb='#24292e'
sf='#d1d5da'
sb='#586069'

dmenu_run -fn $font -m $monitor -nb $nb -nf $nf -sb $sb -sf $sf
