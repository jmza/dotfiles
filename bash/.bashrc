[ -z "$PS1" ] && return
export HISTCONTROL=ignoredups
export HISTFILE=~/.bash_history.d/`hostname`
export VIMINFOFILE=~/.vim/viminfo.`hostname`
shopt -s checkwinsize
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
	debian_chroot=$(cat /etc/debian_chroot)
fi
case "$TERM" in
*)
	PS1="\D{%H:%M} \[\e[1;$((31 + $(hostname | cksum | cut -c1-3) % 6))m\]\h\[\e[0m\]:\w \u\$ "
	;;
esac
case "$TERM" in
xterm*|rxvt*)
	PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
	;;
*)
	;;
esac
if [ "$TERM" != "dumb" ]; then
	eval "`dircolors -b`"
fi
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi
export LC_ALL=fi_FI.UTF-8
export LANG=fi_FI.UTF-8
if [ -e "/var/www/$USER" ] ; then
	export CDPATH=.:/var/www/$USER
fi
shopt -s histappend
shopt -s cdspell
export HISTIGNORE="&:ls:[bf]g:exit"
export HISTSIZE=2000

