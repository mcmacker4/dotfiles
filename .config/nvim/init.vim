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

map <leader>s :Ack<Space>
map <leader>h :noh<CR>
map <leader>w :wa<CR>

" Proper search
set incsearch
set ignorecase
set smartcase
set gdefault

set wildignore+=*/node_modules/*


" Plugin Loader
source ~/.config/nvim/plugins.vim

" set filetypes as typescriptreact
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.jsx

" Set CtrlP to search buffers and files at the same time
let g:ctrlp_cmd = 'CtrlP :pwd'
let g:ctrlp_max_files = 0

" Search results centered please
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" Coc Settings
source ~/.config/nvim/coc-settings.vim

" Theme
set background=dark
colorscheme base16-gruvbox-dark-hard
syntax on
hi Normal ctermbg=NONE

" BufExplorer Settings
map <leader>o :BufExplorer<CR>

" Auto Pairs Settings
let g:AutoPairs={'(':')', '[':']', '{':'}',"'":"'",'"':'"', "`":"`"}

" Airline Status Line Settings
let g:airline_powerline_fonts=1
let g:airline_theme='base16_atelierdune'
let g:airline#extensions#coc#enabled = 1

" NERDTree Settings
map <leader>n :NERDTreeFocus<CR>
map <leader><C-n> :NERDTreeToggle<CR>

" ALE Settings
let g:ale_completion_enabled=1
let g:airline#extensions#ale#enabled=1

" Rust Vim
let g:rustfmt_autosave=1

