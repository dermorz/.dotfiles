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
map <F5> :tabe %<CR>
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
map ö [
map ä ]
set statusline=%<%f\ %{fugitive#statusline()}%=\ lin:%l\/%L\ col:%2c\ pos:%4o\ %P
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv
nmap <C-Left> <<
nmap <C-Right> >>
vmap <C-Left> <<
vmap <C-Right> >>
