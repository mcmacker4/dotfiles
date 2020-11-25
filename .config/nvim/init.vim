""""""""""""""""
" Vim Settings "
""""""""""""""""
let mapleader=','

set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set smarttab

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

inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

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


"""""""""""""""""""""
" Deoplete Settings "
"""""""""""""""""""""
Plug 'Shougo/deoplete.nvim'
let g:deoplete#enable_at_startup=1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"


""""""""""""""""""
" Deoplete Racer "
""""""""""""""""""
Plug 'sebastianmarkow/deoplete-rust'
let g:deoplete#sources#rust#racer_binary='/home/mcmacker4/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path='/home/mcmacker4/.local/lib/rust-src/library'

""""""""""""
" Rust Vim "
""""""""""""
Plug 'rust-lang/rust.vim'
let g:rustfmt_autosave=1

"""""""""""""""""""""
" End Plugin Loader "
"""""""""""""""""""""
call plug#end()
