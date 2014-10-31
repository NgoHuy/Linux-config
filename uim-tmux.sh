#!/bin/bash
# Author: Severus <severus@theslinux.org>
# Purpose: input method for each tmux window
# License: GPLv3 (http://www.gnu.org/copyleft/gpl.html)

window=$(tmux display-message -p '#I')
lockfile="/tmp/uim.lock"

if [[ $window -eq 0 ]] ; then
  [[ -f $lockfile ]] && exit 0
  touch $lockfile 
  xdotool key ctrl+space
elif [[ $window -gt 0 ]] && [[ -f $lockfile ]]; then
  rm $lockfile 
  xdotool key ctrl+space
fi
  
