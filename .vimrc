colorscheme koehler

syntax on
set nocompatible

" Dein
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
    call dein#begin('~/.cache/dein')

    call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

    call dein#add('Shougo/deoplete.nvim')
    call dein#add('tpope/vim-fugitive')
    call dein#add('tpope/vim-surround')
    call dein#add('scrooloose/nerdtree')
    call dein#add('scrooloose/nerdcommenter')
    call dein#add('vim-airline/vim-airline')
    call dein#add('vim-airline/vim-airline-themes')
    call dein#add('editorconfig/editorconfig-vim')
    call dein#add('mattn/emmet-vim')
    call dein#add('wsdjeg/dein-ui.vim')

    " Conditionals
    call dein#add('carlitux/deoplete-ternjs', {'on_ft': ['js', 'jsx', 'json', 'ts', 'tsx']})
    call dein#add('sebastianmarkow/deoplete-rust')
    call dein#add('zchee/deoplete-jedi', {'on_ft': ['py', 'rpy']})
    call dein#add('HerringtonDarkholme/yats.vim')
    call dein#add('mhartington/nvim-typescript', {'build': './install.sh', 'on_ft': ['ts', 'tsx']})
    call dein#add('pangloss/vim-javascript', {'on_ft': ['js', 'jsx', 'json']})
    call dein#add('zchee/deoplete-clang')
    call dein#add('deoplete-plugins/deoplete-go', {'build': 'make', 'on_ft': ['go']})
    call dein#add('fatih/vim-go')

    call dein#end()
    call dein#save_state()
endif

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

" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#jedi#show_docstring = 1

" TernJS
let g:deoplete#sources#ternjs#types = 1
let g:deoplete#sources#ternjs#depths = 1
let g:deoplete#sources#ternjs#docs = 1
let g:deoplete#sources#ternjs#case_insensitive = 1

" Rust
let g:deoplete#sources#rust#racer_binary='~/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path='~/.rustup/toolchains/stable-x86_64-unknown-linux-gnu'

" Clang
let g:deoplete#sources#clang#libclang_path='/usr/lib/libclang.so'

" Golang
let g:deoplete#sources#go#gocode_binary=$GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

" END DEOPLETE

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='badwolf'

set ruler
set number

set wildmenu

" Compiled assets
set wildignore=*.o,*~,*.pyc

set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
set wildignore+=*.bmp,*.png,*.gif,*.jpg,*.jpeg,*.ico

set wildignore+=*.min.css,*.min.js
set wildignore+=.node_modules/*

function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#manual_complete()

set ignorecase
set nohlsearch
set incsearch

set colorcolumn=120

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

inoremap <C-a> <C-o>0
inoremap <C-e> <C-o>$

inoremap <M-Left> <C-o>b
inoremap <M-Right> <C-o>w
inoremap <M-h> <C-o>b
inoremap <M-l> <C-o>w
inoremap <M-k> <C-o>G
inoremap <M-j> <C-o>gg

" Commands
command! MakeTags !ctags -R .

iab target="_blank" target="_blank" rel="noopener noreferrer"
