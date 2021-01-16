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
map <leader>f :Format<CR>

" Proper search
set incsearch
set ignorecase
set smartcase
set gdefault

set wildignore+=*/node_modules/*


" Plugin Loader
source ~/.config/nvim/plugins.vim

source ~/.config/nvim/treesitter.vim

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

" Move lines up or down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" CMake Build
nnoremap <F5> :CMakeGenerate<CR>
nnoremap <F6> :CMakeBuild -j4<CR>

" Coc Settings
source ~/.config/nvim/coc-settings.vim

" Run Coc Format when leaving insert mode
" autocmd InsertLeave * Format

" Theme
set background=dark
syntax on
hi Normal ctermbg=NONE
set termguicolors
colorscheme base16-helios
" Airline Status Line Settings
let g:airline_powerline_fonts=1
let g:airline_theme='term'
let g:airline#extensions#coc#enabled = 1

" BufExplorer Settings
map <leader>o :BufExplorer<CR>

" Auto Pairs Settings
let g:AutoPairs={'(':')', '[':']', '{':'}',"'":"'",'"':'"', "`":"`"}

" NERDTree Settings
map <leader>n :NERDTreeFocus<CR>
map <leader><C-n> :NERDTreeToggle<CR>

" ALE Settings
let g:ale_completion_enabled=1
let g:airline#extensions#ale#enabled=1

" Rust Vim
let g:rustfmt_autosave=1

