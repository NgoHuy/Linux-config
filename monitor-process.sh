#!/bin/bash

flag=1

function kill_() {
	kill $pid
	$name &
	echo "$name killed due to use high memory" >> ~/kill.log
}

function ask_ () {
dialog --backtitle "Ask your permission" \
	--title "ask kill or not ?" \
	--yesno "Do you want to kill process due to high memory usage ?" 7 70

response=$?
case $response in
	0) kill_ ;;
        1) : ;;
	255) : ;;
esac
}

function decide() {
dialog --backtitle "ask your mind" \
       --title "ask appear or not ?" \
       --yesno "Do you want to appear it again (no if you want to automatically kill process) ?" 7 70

response=$?

case $response in
	0) : ;;
	1) flag=0 ;;
	255) : ;;
esac
}

decide

while [[ 1 ]]
do
	pid=$(ps -eo pmem,pid,cmd | sort -n -r | head -1 | awk '{printf("%d",$2)}')
	mem_used=$(ps -eo pmem,pid,cmd | sort -n -r | head -1 | awk '{printf("%d",$1)}')
	name=$(ps -eo pmem,pid,cmd | sort -n -r | head -1 | awk '{printf("%s",$3)}')
	
	if [[ $mem_used -gt 17 ]] ; then
		aplay /usr/share/sounds/alsa/Front_Center.wav
		if [ $flag -eq 0 ] ; then
			kill_
		else
			ask_
		fi
		sleep 10
	fi
done
