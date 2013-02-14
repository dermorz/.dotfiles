#!/bin/sh

cd $HOME 
for dotfile in $(find .dotfiles -maxdepth 1 | grep -e "^\.dotfiles/\..*" | grep -v git)
do
    ln -v -s $dotfile .
done
cd - 1>/dev/null
