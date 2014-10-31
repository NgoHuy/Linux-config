#!/bin/bash

flag=1

function kill_() {
	kill $pid
	$name &
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

while true
do
	pid=$(pgrep $name)
	mem_used=$(ps -eo pmem | sort -n -r | head -1 | awk '{printf("%d",$1)}')
        name=$(ps -eo pmem,cmd | sort -n -r | head -1 | awk '{printf("%s",$2)}')
	
	if [[ $mem_used -gt 17 ]] ; then
		aplay /usr/share/sounds/alsa/Front_Center.wav
		if [ $flag -eq 0 ] ; then
			kill_
		else
			ask_
		fi
		echo "$name killed due to use high memory at $(date)" >> ~/kill.log
		sleep 10
	fi
done
