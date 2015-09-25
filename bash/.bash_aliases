alias ls='ls --color=auto'
alias ":ls"=ls
alias ":q"=exit
alias ":w"=sync
alias ":e"=vim
alias hr='printf "%$(tput cols)s\n"|tr " " "="'
alias HR='printf "%$(tput cols)s\n" `date`|tr " " "="'
function reverse {
	host $1 | host $(awk '{print $4}')
}
