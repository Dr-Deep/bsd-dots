# ~/.bash_profile @Dr.Deep

# source ~/.bashrc
if [[ -f ~/.bashrc ]] ; then
	. ~/.bashrc
fi

# start X
pgrep -x X > /dev/null || startx -- -listen tcp
