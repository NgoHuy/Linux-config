#!/bin/bash
#script for /etc/issue file to display info before login"
clear > /etc/issue

echo -e "\033[0;34m Arch Linux (\l)" >> /etc/issue

echo -e "\033[0;32m Welcome to \e[0;31m `hostname`" >> /etc/issue

echo -e "       \033[0;32mARCH   \033[0;37m= `uname -m`                                  " >> /etc/issue
echo -e "       \033[0;32mKERNEL \033[0;37m= `uname -r`                                 " >> /etc/issue
echo -e "       \033[0;32mCPU    \033[0;37m= Intel Dual Core                                   " >> /etc/issue

echo -e "\033[0;37m Who are you ? And what do you wanna do with me ?" >> /etc/issue

echo -e "\033[0;31m If you're hacker. Are you fucking kidding me !" >> /etc/issue

echo -e "\033[0;32m And sure, If you're not, please feel comfortable and crazy. I'm your pet " >> /etc/issue

echo -e "\033[0;37m" >> /etc/issue
