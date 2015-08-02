#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

WM=dwm

/usr/local/bin/dwmstatus &

xset r rate 330 45 &

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice

case "$WM" in
    dwm)
        (exec feh --bg-fill /home/cyang/media/backgrounds/wallhaven-11940-purple-paint.jpg \
            --bg-fill /home/cyang/media/backgrounds/wallhaven-11940-purple-paint.jpg) &
        exec /usr/local/bin/dwm
    ;;
esac
