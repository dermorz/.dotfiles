filetype off
filetype plugin indent on

" general stuff
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

" terraform
let g:terraform_align=1
let g:terraform_fmt_on_save=1

" ultisnips
let g:UltiSnipsExpandTrigger = "<nop>"

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --hidden --ignore-case --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
  \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
  \   <bang>0)

nnoremap <silent> <C-P> :Files<CR>
nnoremap <silent> <C-G> :Rg<CR>
nnoremap <silent> <leader>p :Buffers<CR>

" ctrlP
set wildignore+=*.pyc,*.swp,*.swo


nmap <silent> <C-h> :cprev<CR>
nmap <silent> <C-l> :cnext<CR>

" color settings
set t_Co=256
let g:seoul256_background = 236
colorscheme seoul256
let g:airline_theme='zenburn'

" airline stuff
set laststatus=2

" configure sort-motion
let g:sort_motion_flags = "ui"

" use ag on :Ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

autocmd CursorHold * silent call CocActionAsync('highlight')

" incsearch mappings
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)

" format json with python
command! JSON %!python -m json.tool

" preview markdown as pdf
command! MD 5sp term://gomd

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

autocmd BufNewFile,BufRead *.sh,*.yml,*.yaml
     \ set autoindent |
     \ set expandtab |
     \ set fileformat=unix |
     \ set shiftwidth=2 |
     \ set softtabstop=2 |
     \ set tabstop=2

autocmd BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_auto_sameids = 0
let g:go_fmt_command = "goimports"
let g:go_metalinter_command = "golangci-lint run -e 'composite literal uses unkeyed fields'"
let g:go_metalinter_autosave = 0
let g:go_metalinter_enabled = ['govet', 'golint', 'errcheck', 'structcheck']
let g:go_metalinter_autosave_enabled = ['govet', 'golint']
let g:go_addtags_transform = "snakecase"
let g:go_def_mode = "gopls"
let g:go_referrers_mode = "gopls"
let g:go_info_mode = "gopls"
let g:go_def_mapping_enabled = 0
let g:go_doc_popup_window = 1

autocmd Filetype tex setl updatetime=1
let g:livepreview_previewer = 'open -a Preview'

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
map <leader>f :Ack -w <cword><CR>
nmap <leader>a <Plug>(coc-codeaction-selected)
vmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>rn <Plug>(coc-rename)
nnoremap <silent> K :call <SID>show_documentation()<CR>
map <leader>b O# TODO(moritz): REMOVE THIS!<CR>import pdb; pdb.set_trace()<ESC>
" `ginkgo watch` in horizontal split
nmap <leader>gw :cd %:p:h<CR>:15sp term://ginkgo watch -tags unit,integration<CR>:cd -<CR>
nmap <leader>gu :cd %:p:h<CR>:15sp term://ginkgo watch -tags unit<CR>:cd -<CR>


" visual mode mappings
vmap <C-i> !eingefuhrt<CR>
vmap <C-y> :YapfFormat<CR>

" EasyAlign
nmap ga <Plug>(EasyAlign)
nmap <leader>t vip:EasyAlign *\|<CR>

" buffer navigation
nmap H :bp<CR>
nmap L :bn<CR>

" shell in buffer
map <leader>z :vs term://zsh<CR>
tnoremap <Esc><Esc> <C-\><C-n>

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

"vimwiki
let brain = {}
let brain.path = '~/vimwiki/brain/'
let brain.syntax = 'markdown'
let brain.ext = '.md'
let brain.index = 'README'
let brain.nested_syntaxes = {'python': 'python', 'go': 'go', 'sql': 'sql', 'sh': 'sh'}

let g:vimwiki_list = [brain]
let g:vimwiki_global_ext = 0

let g:vimtex_compiler_latexmk = {
      \ 'executable' : 'latexmk',
      \ 'options' : [
      \   '-xelatex',
      \   '-file-line-error',
      \   '-synctex=1',
      \   '-interaction=nonstopmode',
      \ ],
      \}
