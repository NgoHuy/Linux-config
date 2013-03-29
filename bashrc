#
# ~/.bashrc
#

# If not running interactively, don't do anything

source /usr/share/doc/pkgfile/command-not-found.bash

complete -cf sudo

[[ $- != *i* ]] && return

alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '
PS1='\[\e[1;32m\]You"re \[\e[1;31m\]\u \[\e[1;32m\]at\[\e[1;32m\] \[\e[0;37m\]\h \[\e[0;36m\]\W \[\e[0;37m\]\n\u: '


#Bash
export HISTCONTROL=erasedups


