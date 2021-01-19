" Use Vim settings instead of Vi settings
set nocompatible

" General config
set hidden
set hlsearch
set cmdheight=2
set updatetime=300
set signcolumn=number
set splitbelow
set splitright
syntax on
set list
set listchars=eol:¬,tab:»\ ,nbsp:·,trail:·,extends:→,precedes:←
set nofoldenable
set lazyredraw
set backspace=indent,eol,start
set visualbell
set encoding=UTF-8

" =============== Plugin initialization ===============
if filereadable(expand("~/.config/nvim/plugins.vim"))
  source ~/.config/nvim/plugins.vim
endif

" Line numbers
set number
set relativenumber
set ruler

" Turn off swap files
set noswapfile
set nobackup
set nowritebackup

" Indentation
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" Set leaders
let mapleader=" "
let maplocalleader=";"

" set runtimepath^=~/.vim runtimepath+=~/.vim/after
" let &packpath = &runtimepath
source ~/.vimrc
