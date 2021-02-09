#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -e $HOME/.bash_aliases ]; then
	    source $HOME/.bash_aliases
fi

# Default $PS1
#PS1='[\u@\h \W]\$ '

# Spaceship $PS1
PS1='\[\033[0;31m\] \u\[\033[00m\] in \[\033[0;35m\]\w\n\[\033[01;32m\] > \[\033[00m\]'
