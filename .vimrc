set nocompatible
set hidden
set hlsearch
set cursorline
set number
set ruler
" Pathogen load
 filetype off

 call pathogen#infect()
 call pathogen#helptags()

 filetype plugin indent on
syntax on
map <F12> :NERDTreeTabsToggle<CR>
map <F5> :tabe %<CR>
set smartindent
set tabstop=4
set shiftwidth=4
set backspace=2
set expandtab
set list
set listchars=eol:¬,tab:»\ ,nbsp:·,extends:→,precedes:←
set colorcolumn=80
set nofoldenable
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map ö [
map ä ]
" Powerline setup
set guifont=Anonymous\ Pro
set laststatus=2
" Bubble single lines
nmap <C-Up> öe
nmap <C-Down> äe
" Bubble multiple lines
vmap <C-Up> öegv
vmap <C-Down> äegv
nmap <C-Left> <<
nmap <C-Right> >>
vmap <C-Left> <
vmap <C-Right> >
let g:zenburn_high_Contrast=1
color zenburn
let g:pymode_rope = 0
let g:pymode_lint_ignore="E501,C901"
set diffopt+=vertical
" format json with python
command JSON %!python -m json.tool
