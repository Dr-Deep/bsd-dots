#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/Xresources
sysmodmap=/etc/X11/xinit/Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -n "`/etc/X11/chooser.sh`" ]; then
    command="`/etc/X11/chooser.sh`"
else
    failsafe="yes"
fi

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?* ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

if [ -n "$failsafe" ]; then
    xhost + inet:10.0.0.1
    dbus-daemon --session --address=unix:path=/home/deep/.dbus/session-bus &
    export DBUS_SESSION_BUS_ADDRESS="unix:path=/home/deep/.dbus/session-bus"
    export DBUS_SESSION_BUS_PID="$(pgrep dbus-daemon)"
    feh --bg-fill ~/Bilder/background.jpg &
    picom --xrender-sync-fence &
    dunst &
    pipewire &
    pipewire-media-session &
    ~/.config/polybar/launch-bar.sh &
    setxkbmap de
    pgrep -x sxhkd > /dev/null || sxhkd &
    exec bspwm
else
    exec $command
fi
