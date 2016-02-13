set encoding=utf-8
" Vundle setup
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage itself
Plugin 'VundleVim/Vundle.vim'

" my plugins
Plugin 'bling/vim-airline'
Plugin 'christoomey/vim-sort-motion'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'nvie/vim-flake8'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'

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

" run flake8 on every python file save
autocmd BufWritePost *.py call Flake8()
" more flake8
let g:flake8_show_in_gutter=1
let g:flake8_show_in_file=1

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
set backspace=2

" airline fix
set laststatus=2

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

nmap _$ :call Preserve("%s/\\s\\+$//e")<CR>
map <leader>j :call Preserve("JSON")<CR>
map <leader>w :w<CR>
