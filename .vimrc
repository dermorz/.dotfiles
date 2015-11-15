" Vundle setup
"
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage itself
Plugin 'gmarik/Vundle.vim'

" my plugins
"
Plugin 'bling/vim-airline' 
Plugin 'tpope/vim-fugitive'
Plugin 'davidhalter/jedi-vim'
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

" python stuff
" au BufNewFile,BufRead *.py
"     \ set tabstop=4 |
"     \ set softtabstop=4 |
"     \ set shiftwidth=4 |
"     \ set textwidth=79 |
"     \ set expandtab |
"     \ set autoindent |
"     \ set fileformat=unix
" au BufNewFile,BufRead *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
