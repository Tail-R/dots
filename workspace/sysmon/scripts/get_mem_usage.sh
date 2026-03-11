#! /usr/bin/env bash

mem_total_kb=$(grep MemTotal /proc/meminfo | awk '{print $2}')
mem_free_kb=$(grep MemAvailable /proc/meminfo | awk '{print $2}')

if [[ ! "$mem_total_kb" =~ ^[0-9]+$ ]] || [ ! "$mem_total_kb" -gt 0 ]; then
    echo -1

    exit
fi

echo $(( ($mem_total_kb - $mem_free_kb) * 100 / $mem_total_kb))

