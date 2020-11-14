""""""""""""""""
" Vim Settings "
""""""""""""""""
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set smarttab

set nowrap
set number

set autoindent
set smartindent

set shell=/bin/fish

" vnoremap $1 <esc>`>a)<esc>`<i(<esc>
" vnoremap $2 <esc>`>a]<esc>`<i[<esc>
" vnoremap $3 <esc>`>a}<esc>`<i{<esc>
" vnoremap $$ <esc>`>a"<esc>`<i"<esc>
" vnoremap $q <esc>`>a'<esc>`<i'<esc>
" vnoremap $e <esc>`>a`<esc>`<i`<esc>
" inoremap $1 ()<esc>i
" inoremap $2 []<esc>i
" inoremap $3 {}<esc>i
" inoremap $4 {<esc>o}<esc>O
" inoremap $q ''<esc>i
" inoremap $e ""<esc>i

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

let mapleader=','


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


""""""""""""""""
" Deoplete Settings "
""""""""""""""""
Plug 'Shougo/deoplete.nvim'
let g:deoplete#enable_at_startup=1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"


"""""""""""""""""""""
" End Plugin Loader "
"""""""""""""""""""""
call plug#end()
