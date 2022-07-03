let mapleader = " "

set fileencoding=utf-8
set encoding=utf-8

set number relativenumber

set nowrap
set sidescrolloff=3
set scrolloff=3

set incsearch

set ignorecase
set smartcase

set mouse=a

set tabstop=2 
set softtabstop=2 
set shiftwidth=2 
set expandtab
set smarttab

set autoindent
set smartindent

set wildmenu
set wildmode=longest:full

set hidden
set splitbelow
set splitright

set formatoptions-=ro

set termguicolors
set background=dark

filetype plugin on

let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_hide = 0
let g:netrw_liststyle = 3
let g:netrw_winsize = 25 

nnoremap <leader>e :Lex<cr>

nnoremap <leader>y "+y
nnoremap <leader>p "+p

nnoremap <leader>/ :nohl<cr>

nnoremap <leader>dc :put =strftime('%A, %B %d, %Y')<cr>kJ
nnoremap <Leader>rc :source $MYVIMRC<CR>

call plug#begin(stdpath('data') . '/plugged')

Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

Plug 'junegunn/goyo.vim'
" {{{
  nnoremap <Leader>z :Goyo<CR>
" }}}

Plug 'arcticicestudio/nord-vim' 
Plug 'catppuccin/nvim', {'as': 'catppuccin'}

call plug#end()

colorscheme catppuccin
