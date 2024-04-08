#! /usr/bin/env bash

# ~~~~~ Warning! ~~~~~
# The backlight name is hardcoded lol

brightness=$(cat /sys/class/backlight/intel_backlight/brightness)
max_brightness=$(cat /sys/class/backlight/intel_backlight/max_brightness)

echo "$brightness * 100 / $max_brightness" | bc

