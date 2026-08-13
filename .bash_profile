# ~/.bash_profile kirby@bsdlab

# If not running interactively, don't do anything.
if [[ $- != *i* ]] ; then
    return
fi

export KITTY_ENABLE_WAYLAND=1
export MOZ_ENABLE_WAYLAND=1
export XDG_SESSION_TYPE=wayland
export XDG_RUNTIME_DIR=/var/run/user/`id -u`
export SDL_VIDEODRIVER=wayland
export GDK_BACKEND=wayland

[ -d $XDG_RUNTIME_DIR ] || mkdir -m 700 -p $XDG_RUNTIME_DIR

# source ~/.bashrc
if [[ -f ~/.bashrc ]] ; then
        . ~/.bashrc
fi
