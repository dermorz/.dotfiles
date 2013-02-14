set nocompatible
set hidden
set hlsearch
set cursorline
set number
set ruler
set laststatus=2
" Pathogen load
 filetype off

 call pathogen#infect()
 call pathogen#helptags()

 filetype plugin indent on
syntax on
map <F12> :NERDTreeTabsToggle<CR>
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set list
set listchars=eol:¬,tab:»\ ,nbsp:■,extends:→,precedes:←
set colorcolumn=80
map ,e :FufCoverageFile<CR>
map ,E :FufFile<CR>
map ,r :FufTag<CR>
map ,R :FufTagWithCursorWord<CR>
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
