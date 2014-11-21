#!/bin/bash
# Author: Severus <severus@theslinux.org>
# Purpose: input method for each tmux window
# License: GPLv3 (http://www.gnu.org/copyleft/gpl.html)

window=$(tmux display-message -p '#W') # get window name
lockfile="/tmp/uim.lock"

prog=$(pgrep weechat)
if [[ "$prog" == "" ]]; then
  exit 0
fi

touch $lockfile

if [[ "$window" == "irc" ]] ; then
  uim_on=$(cat $lockfile)
  [[ $uim_on -eq 1 ]] && exit 0
  echo 1 > $lockfile && xdotool key ctrl+space
else
  uim_on=$(cat $lockfile)
  [[ $uim_on -eq 0 ]] && exit 0 
  echo 0 > $lockfile && xdotool key ctrl+space
fi
  
