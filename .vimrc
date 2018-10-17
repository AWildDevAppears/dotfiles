execute pathogen#infect()
syntax on
filetype plugin indent on

set backspace=indent,eol,start

let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.pyc$','^node_modules$', '^.git$', '\.DS_Store$']

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
