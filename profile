# /etc/profile

#Set our umask
umask 022

# Set our default path
PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin"
export PATH

# Load profiles from /etc/profile.d
if test -d /etc/profile.d/; then
	for profile in /etc/profile.d/*.sh; do
		test -r "$profile" && . "$profile"
	done
	unset profile
fi

# Source global bash config
if test "$PS1" && test "$BASH" && test -r /etc/bash.bashrc; then
	. /etc/bash.bashrc
fi

# Termcap is outdated, old, and crusty, kill it.
unset TERMCAP

# Man is much better than us at figuring this out
unset MANPATH

#user define
echo -e "\e[0;32m#=============================================================================#"
echo -e "			\e[0;37mWelcome \e[0;31m`whoami` \e[0;37mto \e[01;31m`hostname`"                
echo -e "\e[0;32m#=============================================================================#"