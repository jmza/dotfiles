execute "set viminfo='200,:200,<500,/100,h,n".escape($VIMINFOFILE, ' ')
execute pathogen#infect()
syntax on
filetype plugin on
set hlsearch
set encoding=utf8
set termencoding=utf8
set fileencoding=utf8
set ts=4
set sw=4
set ai
set tildeop
set t_Co=256
set hidden
set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000
let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme delek
set incsearch ignorecase
set laststatus=2
let g:airline_powerline_fonts=1
let g:airline_section_y=""
let g:syntastic_php_checkers = ['php']
let g:airline_theme="wombat"
let g:airline_left_sep = '▌'
let g:airline_left_alt_sep = '░'
let g:airline_right_sep = '▐'
let g:airline_right_alt_sep = '░'
if ! exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
function! ResCur()
	if line("'\"") <= line("$")
	normal! g`"
	return 1
	endif
endfunction

augroup resCur
	autocmd!
	autocmd BufWinEnter * call ResCur()
augroup END
