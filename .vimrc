set encoding=utf-8
" Vundle setup
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage itself
Plugin 'VundleVim/Vundle.vim'

" my plugins
Plugin 'christoomey/vim-sort-motion'
Plugin 'christoomey/vim-system-copy'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'fisadev/vim-isort'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'nanotech/jellybeans.vim'
Plugin 'nvie/vim-flake8'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

call vundle#end()
filetype plugin indent on

" general stuff
let mapleader=" "

" split navigation
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

" unmap arrow keys to force myself to use HJKL
for prefix in ['i', 'n', 'v']
  for key in ['<Down>', '<Left>', '<Right>', '<Up>']
    exe prefix . "noremap" . key . " <Nop>"
  endfor
endfor

" more flake8
let g:flake8_show_in_gutter=1
let g:flake8_show_in_file=1

" jedi autocomplete options
let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = "0"

" vim-fugitive settings
set diffopt+=vertical

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
set pastetoggle=<F2>
set backspace=2

" color settings
set t_Co=256
colorscheme zenburn
highlight UnderCursor ctermbg=130 ctermfg=7
autocmd CursorMoved * exe printf('match UnderCursor /\V\<%s\>/', escape(expand('<cword>'), '/\'))

" airline stuff
set laststatus=2

" configure sort-motion
let g:sort_motion_flags = "ui"

" format json with python
command JSON %!python -m json.tool

" python stuff
autocmd BufNewFile,BufRead *.py
     \ set autoindent |
     \ set expandtab |
     \ set fileformat=unix |
     \ set shiftwidth=4 |
     \ set softtabstop=4 |
     \ set tabstop=4
highlight OverLength ctermfg=darkgray
autocmd BufNewFile,BufRead *.py,*.pyw,*.c,*.h match OverLength /\%101v.*/

" bash stuff
autocmd BufNewFile,BufRead *.sh
     \ set autoindent |
     \ set expandtab |
     \ set fileformat=unix |
     \ set shiftwidth=2 |
     \ set softtabstop=2 |
     \ set tabstop=2

" helper to preserve state on commands
function! Preserve(command)
  let _s=@/
  let l = line(".")
  let c = col(".")
  execute a:command
  let @/=_s
  call cursor(l, c)
endfunction

" some leader shortcuts
map <leader>w :w<CR>
map <leader>k :cprev<CR>
map <leader>j :cnext<CR>
map <leader>i :Isort<CR>


" some on_write triggers
" remove trailing whitespace
autocmd BufWritePost *
     \ silent call Preserve("%s/\\s\\+$//e")
" run flake8 on this file
autocmd BufWritePost *.py
     \ call Flake8()
