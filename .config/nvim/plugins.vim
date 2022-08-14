call plug#begin(stdpath('data') . '/plugged')

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'

Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'

Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'tikhomirov/vim-glsl'

Plug 'chriskempson/base16-vim'

Plug 'preservim/nerdtree'
" Plug 'mcchrish/nnn.vim'

Plug 'cdelledonne/vim-cmake'

Plug 'neoclide/coc.nvim', { 'branch': 'release' }

Plug 'dag/vim-fish'

call plug#end()
