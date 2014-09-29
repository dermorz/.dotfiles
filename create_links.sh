#!/bin/sh

git submodule init
git submodule update

cd $HOME 
for dotfile in $(find .dotfiles -maxdepth 1 | grep -e "^\.dotfiles/\..*" | grep -v git)
do
    ln -v -f -s $dotfile .
done
cd - 1>/dev/null
