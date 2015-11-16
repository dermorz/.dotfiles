" Vundle setup
"
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage itself
Plugin 'VundleVim/Vundle.vim'

" my plugins
"
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'davidhalter/jedi-vim'
Plugin 'nvie/vim-flake8'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'hynek/vim-python-pep8-indent'
"
" my plugins

call vundle#end()
filetype plugin indent on
"
" Vundle setup

" general stuff
let mapleader=" "

" split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" unmap arrow keys to force myself to use HJKL
for prefix in ['i', 'n', 'v']
  for key in ['<Up>', '<Down>', '<Left>', '<Right>']
    exe prefix . "noremap" . key . " <Nop>"
  endfor
endfor

" run flake8 on every python file save
autocmd BufWritePost *.py call Flake8()

" jedi autocomplete options
"
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#popup_on_dot = 0
"

" general stuff
set nocompatible
set hidden
set hlsearch
set cursorline
set number
set relativenumber
set ruler
set splitbelow
set splitright
syntax on
set list
set listchars=eol:¬,tab:»\ ,nbsp:·,trail:·,extends:→,precedes:←
set nofoldenable
let g:zenburn_high_Contrast=1
color zenburn
set pastetoggle=<F2>
" format json with python
command JSON %!python -m json.tool

" python stuff
autocmd BufNewFile,BufRead *.py
     \ set tabstop=4 |
     \ set softtabstop=4 |
     \ set shiftwidth=4 |
     \ set expandtab |
     \ set autoindent |
     \ set fileformat=unix
highlight OverLength ctermfg=darkgray
autocmd BufNewFile,BufRead *.py,*.pyw,*.c,*.h match OverLength /\%81v.*/
