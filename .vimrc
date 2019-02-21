execute pathogen#infect()
colorscheme koehler

syntax on
set nocompatible
filetype plugin indent on

set encoding=utf8
set autoread
set backspace=indent,eol,start
set path+=**

" Nerd Tree
let NERDTreeShowHidden=1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeIgnore = ['\.pyc$','^node_modules$', '^.git$', '\.DS_Store$']

nnoremap <Leader>f :NERDTreeToggle<Enter>

autocmd StdinReadPre * let s:std_in=1

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" ALE
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0
let g:ale_sign_column_always = 1

set ruler
set number

set wildmenu

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='badwolf'

" Compiled assets
set wildignore=*.o,*~,*.pyc

set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
set wildignore+=*.bmp,*.png,*.gif,*.jpg,*.jpeg,*.ico

set wildignore+=*.min.css,*.min.js
set wildignore+=.node_modules/*

" YouCompleteMe
let g:ycm_error_symbol = '●'
let g:ycm_autoclose_preview_window_after_completion = 1

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

" Whitespace highlighting
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Run prettier on javascript files
autocmd FileType javascript set formatprg=prettier\ --stdin

" Key bindings
nmap <f> :YcmCompleter FixIt<CR>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>

inoremap jj <Esc>
inoremap jk <Esc>

" Commands
command! MakeTags !ctags -R .

