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


set wildignore+=*/node_modules/*


" Plugin Loader
source ~/.config/nvim/plugins.vim

" set filetypes as typescriptreact
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.jsx

" Coc Settings
source ~/.config/nvim/coc-settings.vim

" Theme
colorscheme base16-atelier-dune

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

