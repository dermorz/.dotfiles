" Vim plugin configuration
set rtp+=~/.config/nvim/plugins/

call plug#begin('~/.config/nvim/plugged')

runtime languages.vim
runtime git.vim
runtime textobjects.vim
runtime search.vim
runtime project.vim
runtime vim-improvements.vim
runtime appearance.vim
runtime tools.vim

call plug#end()

