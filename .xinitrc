
if [ -f ~/.Xresources ]; then
    xrdb -merge ~/.Xresources
fi

setxkbmap de
xsetroot -cursor_name left_ptr

sxhkd &
exec bspwm

xrandr --dpi 157.35
