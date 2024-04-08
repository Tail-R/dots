#! /usr/bin/env bash

VIEWER='sxiv'

xdg-mime default $VIEWER.desktop image/png
xdg-mime default $VIEWER.desktop image/jpeg
