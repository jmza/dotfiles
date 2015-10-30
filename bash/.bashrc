[ -z "$PS1" ] && return

HOSTNAME=$(hostname)

# History per host, ignore duplicates and job control
export HISTCONTROL=ignoredups
export HISTFILE=~/.bash_history.d/$HOSTNAME
export HISTIGNORE="&:ls:[bf]g:exit"
export HISTSIZE=2000
shopt -s histappend

# Use fancy prompt for xterm and rxvt-unicode
case "$TERM" in
xterm*|rxvt*)
	COLOR=$((31 + $(echo "$HOSTNAME" | cksum | cut -c 1-3) % 6))
	PS1="\D{%H:%M} \[\e[1;${COLOR}m\]\h\[\e[0m\]:\w \u\$ "
	PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
	eval "`dircolors -b`"
	;;
*)
	PS1="\D{%H:%M} \h:\w \u\$ "
	;;
esac

# Load aliases
[ -f ~/.config/bash/aliases ] && . ~/.config/bash/aliases

# Locale
export LC_ALL=fi_FI.UTF-8
export LANG=fi_FI.UTF-8

shopt -s cdspell

# Update window size meta info after each command
shopt -s checkwinsize

# Vim replated
export EDITOR=/usr/bin/vim
export VIMINFOFILE=~/.vim/viminfo.$HOSTNAME


