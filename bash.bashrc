# System-wide .bashrc file for interactive bash(1) shells.

# To enable the settings / commands in this file for login shells as well,
# this file has to be sourced in /etc/profile.

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, overwrite the one in /etc/profile)
# but only if not SUDOing and have SUDO_PS1 set; then assume smart user.
if ! [ -n "${SUDO_USER}" -a -n "${SUDO_PS1}" ]; then
  PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi

# Commented out, don't overwrite xterm -T "title" -n "icontitle" by default.
# If this is an xterm set the title to user@host:dir
#case "$TERM" in
#xterm*|rxvt*)
#    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
#    ;;
#*)
#    ;;
#esac

# enable bash completion in interactive shells
#if ! shopt -oq posix; then
#  if [ -f /usr/share/bash-completion/bash_completion ]; then
#    . /usr/share/bash-completion/bash_completion
#  elif [ -f /etc/bash_completion ]; then
#    . /etc/bash_completion
#  fi
#fi

# if the command-not-found package is installed, use it
if [ -x /usr/lib/command-not-found -o -x /usr/share/command-not-found/command-not-found ]; then
	function command_not_found_handle {
	        # check because c-n-f could've been removed in the meantime
                if [ -x /usr/lib/command-not-found ]; then
		   /usr/lib/command-not-found -- "$1"
                   return $?
                elif [ -x /usr/share/command-not-found/command-not-found ]; then
		   /usr/share/command-not-found/command-not-found -- "$1"
                   return $?
		else
		   printf "%s: command not found\n" "$1" >&2
		   return 127
		fi
	}
fi
alias cat='cat -n'
#service networking stop
#ifconfig wlan0
#if [ $? -ne 1 ]; then
#	ifconfig wlan0 down
#	macchanger -r wlan0
#fi
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

if [ "$TERM" = "linux" ]; then 
 	echo -en "\e]P0282c34"  #background-color 232323-black 292c37-kali-dark 282c34/35-onedark
 	echo -en "\e]P1ce986a"	#use for data such as 1, 2, darkred->d75f5f, onedark->ce986a/eac07b
 	echo -en "\e]P292cd7b"	#use for char/string such as cout << "????", onedark->98c379/92cd7b; lightgreen 89e34d
 	echo -en "\e]P3da62dd"	#use for special chars & operator, like int, void; onedark->da62dd/c678dd
 	echo -en "\e]P48787af"	#still unknown darkblue
 	echo -en "\e]P5c678dd"	#special commands like for, echo; onedark->da62dd/c678dd
 	echo -en "\e]P6c4bdb5"	#special commands like std, cout; onedark->c4bdb5/abb2bf; other: 5fafaf
 	echo -en "\e]P7c4bdb5"	#text-color 
 	echo -en "\e]P85c6272"	#use for comments, onedark->5c6272;  blue warning-message-color-> 7373c9
 	echo -en "\e]P9e06c75"	#special VARIABLE, like SIGABRT,onedark->ee516e/e06c75 
 	echo -en "\e]PAe5c07b"	#use for showing tabs, like "|"
 	echo -en "\e]PBee516e"	#set host name color, like root or username and time, onedark->ee516e/e06c75
	echo -en "\e]PC61afef"	#diectory color, onedark->55b7fe/61afef(blue)
	echo -en "\e]PDd633b2"	#still unkown
 	echo -en "\e]PE61afef"	#function namere or other instructions like #include, main(), endl; onedark->61afef/55b7fe
	echo -en "\e]PFe5c07b"	#use for current work directory and row number, onedark->98c379/92cd7b(green), brown->44c9c9
 	clear	#for background artifacting
fi

PS1="[\[\e[33;1m\]\u@\H\[\e[0m\] \[\e[37;1m\]\w\[\e[0m\] \[\e[33;1m\]\t\[\e[0m\]]\\$ "
