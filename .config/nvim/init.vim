""""""""""""""""
" Vim Settings "
""""""""""""""""
let mapleader=','

set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set smarttab

set mouse=a

set nowrap
set number relativenumber

set autoindent
set smartindent

set shell=/bin/fish

tnoremap <Esc> <C-\><C-n>

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

map <leader>h :noh<CR>


"""""""""""""""""
" Plugin Loader "
"""""""""""""""""
call plug#begin(stdpath('data') . '/plugged')


""""""""""""""""""""""""
" BufExplorer Settings "
""""""""""""""""""""""""
Plug 'vim-scripts/bufexplorer.zip'
map <leader>o :BufExplorer<CR>


""""""""""""""""""""""""
" Supertab Settings "
""""""""""""""""""""""""
Plug 'ervandew/supertab'


"""""""""""""""""""""
" Sensible Settings "
"""""""""""""""""""""
Plug 'tpope/vim-sensible'


""""""""""""""""
" Ack Settings "
""""""""""""""""
Plug 'mileszs/ack.vim'


"""""""""""""""""""""""""
" Surround.vim Settings "
"""""""""""""""""""""""""
Plug 'tpope/vim-surround'


"""""""""""""""""""""""""
" Auto Pairs Settings"
"""""""""""""""""""""""""
Plug 'https://github.com/jiangmiao/auto-pairs'
let g:AutoPairs={'(':')', '[':']', '{':'}',"'":"'",'"':'"', "`":"`"}


""""""""""""""""""""""""""""""""
" Airline Status Line Settings "
""""""""""""""""""""""""""""""""
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts=1
let g:airline_theme='powerlineish'


"""""""""""""""""""""
" NERDTree Settings "
"""""""""""""""""""""
Plug 'preservim/nerdtree'
map <leader>n :NERDTreeFocus<CR>


""""""""""""""""
" ALE Settings "
""""""""""""""""
Plug 'dense-analysis/ale'
let g:ale_completion_enabled=1
let g:airline#extensions#ale#enabled=1


"""""""""""""""""
" YouCompleteMe "
"""""""""""""""""
Plug 'ycm-core/YouCompleteMe'
set completeopt-=preview


""""""""""""
" Rust Vim "
""""""""""""
Plug 'rust-lang/rust.vim'
let g:rustfmt_autosave=1


"""""""""""""""""""""
" Fish Shell Plugin "
"""""""""""""""""""""
Plug 'dag/vim-fish'


"""""""""""""""""""""
" End Plugin Loader "
"""""""""""""""""""""
call plug#end()
