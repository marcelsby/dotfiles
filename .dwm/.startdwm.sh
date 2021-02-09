#!/bin/sh
nitrogen --restore &
picom &
dwmblocks &
numlockx &
setxkbmap br
exec dwm
