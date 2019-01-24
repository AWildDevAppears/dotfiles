execute pathogen#infect()
syntax on
filetype plugin indent on

set encoding=utf8
set autoread
set backspace=indent,eol,start

let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.pyc$','^node_modules$', '^.git$', '\.DS_Store$']

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>

set ruler

set wildmenu

" Compiled assets
set wildignore=*.o,*~,*.pyc


set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

set ignorecase
set hlsearch
set incsearch

set lazyredraw

set magic
set spell

set noerrorbells
set novisualbell

set expandtab
set smarttab

set shiftwidth=4
set tabstop=4

set ai
set si
set wrap

set t_vb=
set tm=500

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

