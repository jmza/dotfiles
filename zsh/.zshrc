# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=1000
setopt appendhistory
unsetopt autocd beep extendedglob notify
# bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit
compinit
# End of lines added by compinstall

if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
	function zle-line-init() {
		echoti smkx
	}
	function zle-line-finish() {
		echoti rmkx
	}
	zle -N zle-line-init
	zle -N zle-line-finish
fi

# Use emacs key bindings
bindkey -e

# [Esc-w] - Kill from the cursor to the mark
bindkey '\ew' kill-region
# [Esc-l] - run command: ls
bindkey -s '\el' 'ls\n'
# [Ctrl-r] - Search backward incrementally for a specified string. The string may begin with ^ to anchor the search to the beginning of the line.
bindkey '^r' history-incremental-search-backward

# [Home] - Go to beginning of line
if [[ "${terminfo[khome]}" != "" ]]; then
	bindkey "${terminfo[khome]}" beginning-of-line
fi
# [End] - Go to end of line
if [[ "${terminfo[kend]}" != "" ]]; then
	bindkey "${terminfo[kend]}"  end-of-line
fi
# [Delete] - delete forward
if [[ "${terminfo[kdch1]}" != "" ]]; then
	bindkey "${terminfo[kdch1]}" delete-char
else
	bindkey "^[[3~" delete-char
	bindkey "^[3;5~" delete-char
	bindkey "\e[3~" delete-char
fi

setopt HIST_IGNORE_DUPS
ttyctl -f

MY_HOSTCOLOR=$(($(hostname | cksum | cut -c1-3) % 5 + 1))

setopt PROMPT_SUBST
# PROMPT='%B%F{red}%n@%m%f%F{yellow}[%D{%L:%M:%S}]%f:%F{blue}${${(%):-%~}}%f$ %b'
PROMPT='%D{%H:%M:%S} %B%F{$MY_HOSTCOLOR}%m%b:%f$ '
RPROMPT='${${(%):-%~}}'
TMOUT=1

TRAPALRM() {
	zle reset-prompt
}

export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim

alias ls='ls -F --color=auto'
