#! /usr/bin/env bash

backlight=/sys/class/backlight/intel_backlight

if [ ! -f ${backlight}/brightness ]; then
    echo -1

    exit
fi

if [ ! -f ${backlight}/max_brightness ]; then
    echo -1

    exit
fi

brightness=$(cat "${backlight}/brightness")
max_brightness=$(cat "${backlight}/max_brightness")

if [ "$max_brightness" = "0" ]; then
    echo -1
else
    echo $(($brightness * 100 / $max_brightness))
fi

