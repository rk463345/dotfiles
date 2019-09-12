#!/bin/bash

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    # Do not launch dbus before ConsoleKit (FS#25031)
    [ -x "$f" ] && . "$f"
    [ "$f" != "/etc/X11/xinit/xinitrc.d/80-dbus" ] && [ -x "$f" ] && . "$f"
  done
  unset f
fi

xrdb ~/.Xresources &

IBUS_ENABLE_CTRL_SHIFT_U=1 ibus-daemon -d -x -r -n awesome
xmodmap .xmodmap
numlockx &
xmodmap -e 'clear Lock' #ensures you're not stuck in CAPS on mode
xmodmap -e 'keycode 0x42=Escape' #remaps the keyboard so CAPS LOCK=ESC


pulseaudio &
exec awesome
