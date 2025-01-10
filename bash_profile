# ~/.bash_profile @Dr.Deep

# If not running interactively, don't do anything.
if [[ $- != *i* ]] ; then
    return
fi

# wayland running?
pgrep -x Hyprland > /dev/null || exec bash -c "mkdir -p /var/run/user/$(id -u) && chown $(id -un):wheel /var/run/user/$(id -u) && export XDG_RUNTIME_DIR=/var/run/user/`id -u` && dbus-launch Hyprland"

# source ~/.bashrc
if [[ -f ~/.bashrc ]] ; then
        . ~/.bashrc
fi
