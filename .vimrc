colorscheme koehler

syntax on
set nocompatible

" Dein
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
    call dein#begin('~/.cache/dein')

    call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

    call dein#add('tpope/vim-fugitive')
    call dein#add('tpope/vim-surround')
    call dein#add('scrooloose/nerdtree')
    call dein#add('scrooloose/nerdcommenter')
    call dein#add('vim-airline/vim-airline')
    call dein#add('vim-airline/vim-airline-themes')
    call dein#add('editorconfig/editorconfig-vim')
    call dein#add('mattn/emmet-vim')
    call dein#add('wsdjeg/dein-ui.vim')
    call dein#add('jparise/vim-graphql')
    call dein#add('w0rp/ale')

    call dein#add('Shougo/neosnippet.vim')
    call dein#add('Shougo/neosnippet-snippets')

    call dein#add('Shougo/denite.nvim')

    call dein#add('Valloric/YouCompleteMe', {'merged': 0})

    call dein#add('HerringtonDarkholme/yats.vim')
    call dein#add('mhartington/nvim-typescript', {'build': './install.sh', 'on_ft': ['ts', 'tsx']})
    call dein#add('pangloss/vim-javascript', {'on_ft': ['js', 'jsx', 'json']})
    call dein#add('mxw/vim-jsx', { 'on_ft': ['js', 'jsx']})
    call dein#add('jamshedvesuna/vim-markdown-preview', {'on_ft': ['md', 'markdown']})
    call dein#add('fatih/vim-go', {'on_ft': ['go', 'golang']})

    call dein#end()
    call dein#save_state()
endif

let g:ycm_semantic_triggers = {
    \   'css': [ 're!^\s', 're!:\s+', ': '],
    \   'scss': [ 're!^\s', 're!:\s+', ': '],
    \   'less': [ 're!^\s', 're!:\s+', ': '],
    \ }

filetype plugin indent on

set encoding=utf8
set autoread
set backspace=indent,eol,start
set path+=**

set list
set listchars=tab:»-,trail:·

" Nerd Tree
let NERDTreeShowHidden=1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeIgnore = ['\.pyc$','^node_modules$', '^.git$', '\.DS_Store$']

nnoremap <Leader>f :NERDTreeToggle<Enter>

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd BufWritePre * %s/\s\+$//e

" Fugitive
if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif

" Emmet
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}

" ALE
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0
let g:ale_sign_column_always = 1

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline_skip_empty_sections = 1
let g:airline_theme='badwolf'

" Vim Markdown preview
let vim_markdown_preview_github = 1
let vim_markdown_preview_toggle=2

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

cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
