#! /bin/sh

action=$(printf 'toggle-mute\nraise\nlower' | dmenu -p 'volume')
echo $action




#mute	: pactl set-sink-mute @DEFAULT_SINK@ toggle
#lower	: pactl set-sink-volume @DEFAULT_SINK@ -5%
#raise	: pactl set-sink-volume @DEFAULT_SINK@ +5%
