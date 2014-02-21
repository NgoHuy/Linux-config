#!/bin/bash

# Author: Severus <huynhok.uit@gmail.com>
# Purpose: Testing
# License: GPLv3

working=$1

function usage() {
	echo "Usage: program <tracked directory> "
}

function init() {

	if [[ ! -d $working ]]; then	
		echo "Something went wrong !!!"
		echo "Please check directory existence or your permission. Make sure that you have read, write permission on that."
		exit 127
	else
		cd $working
		if [[ ! -d .git ]]; then 
		git init && git add . && git commit -m "Stage 1" > /dev/null 2>&1
		fi
	fi
	
}

function _check() {
	if [[ -z "$working" ]]; then
		usage
		exit 0
	fi

	init $working

	while true
	do	
		mess=$(date)
		# find file modified winthin 30s and make git track. Change time as you want but sleep time must be equal -mmin !!!
		find . -mmin -0.5 -not -iwholename './.git/*' -exec git add '{}' \; -exec git commit -m "$mess" \; -exec git send-email -1 \;
		sleep 30
	done
}
_check

