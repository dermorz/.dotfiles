set encoding=utf-8
" Vundle setup
set nocompatible
filetype off
call plug#begin('~/.vim/plugged')

" my plugins
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'christoomey/vim-sort-motion'
Plug 'christoomey/vim-system-copy'
Plug 'davidhalter/jedi-vim'
Plug 'haya14busa/incsearch.vim'
Plug 'hynek/vim-python-pep8-indent'
Plug 'junegunn/seoul256.vim'
Plug 'kana/vim-textobj-function'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-user'
Plug 'mileszs/ack.vim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-python/python-syntax'
Plug 'w0rp/ale'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()
filetype plugin indent on

" general stuff
let mapleader=" "

let g:fzf_layout = { 'down': '~20%' }
let g:fzf_buffers_jump = 1
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

nnoremap <silent> <C-P> :Files<CR>
nnoremap <silent> <leader>p :Buffers<CR>

" unmap arrow keys to force myself to use HJKL
for prefix in ['i', 'n', 'v']
  for key in ['<Down>', '<Left>', '<Right>', '<Up>']
    exe prefix . "noremap" . key . " <Nop>"
  endfor
endfor

" jedi autocomplete options
let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = "0"

" ctrlP
set wildignore+=*.pyc,*.swp,*.swo

" vim-fugitive settings
set diffopt+=vertical

" general stuff
set nocompatible
set hidden
set hlsearch
"set cursorline
set number
"set relativenumber
set ruler
set splitbelow
set splitright
syntax on
set list
set listchars=eol:¬,tab:»\ ,nbsp:·,trail:·,extends:→,precedes:←
set nofoldenable
set pastetoggle=<F2>
set backspace=2

let g:ale_sign_column_always = 1
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
nmap <silent> <C-h> :cprev<CR>
nmap <silent> <C-l> :cnext<CR>

" color settings
set t_Co=256
let g:seoul256_background = 236
colorscheme seoul256
highlight UnderCursor ctermbg=240
setl updatetime=500
autocmd CursorHold * exe printf('match UnderCursor /\V\<%s\>/', escape(expand('<cword>'), '/\'))
let g:airline_theme='zenburn'

" airline stuff
set laststatus=2

" configure sort-motion
let g:sort_motion_flags = "ui"

" use ag on :Ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" incsearch mappings
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)

" format json with python
command! JSON %!python -m json.tool

" python stuff
autocmd BufNewFile,BufRead *.py
     \ set autoindent |
     \ set expandtab |
     \ set fileformat=unix |
     \ set shiftwidth=4 |
     \ set softtabstop=4 |
     \ set tabstop=4
highlight OverLength ctermfg=darkgray
autocmd CursorHold *.py,*.pyw,*.c,*.h match OverLength /\%101v.*/

autocmd BufNewFile,BufRead *.sh,*.yml
     \ set autoindent |
     \ set expandtab |
     \ set fileformat=unix |
     \ set shiftwidth=2 |
     \ set softtabstop=2 |
     \ set tabstop=2

au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4

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
map <leader>, A,<ESC>
map <leader>J :%!python -m json.tool<CR>
map <leader>b oimport pdb; pdb.set_trace()<ESC>

" visual mode mappings
vmap <C-i> !eingefuhrt<CR>
vmap <C-y> :YapfFormat<CR>

" buffer navigation
nmap H :bp<CR>
nmap L :bn<CR>

"This allows for change paste motion rp{motion}
nmap <silent> rp :set opfunc=ChangePaste<CR>g@
function! ChangePaste(type, ...)
    silent exe "normal! `[v`]\"_c"
    silent exe "normal! p"
endfunction

" some on_write triggers
" remove trailing whitespace
autocmd BufWritePre *
     \ silent call Preserve("%s/\\s\\+$//e")
" run flake8 on this file
" autocmd BufWritePost *.py
"      \ call Flake8()
" tell it to use an undo file
set undofile
" set a directory to store the undo history
set undodir=~/.vimundo/
