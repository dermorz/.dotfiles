#!/bin/sh

echo "(1/4) creating links"
cd $HOME 
for dotfile in $(find .dotfiles -maxdepth 1 | grep -e "^\.dotfiles/\..*" | grep -v git)
do
    ln -f -s $dotfile .
done
ln -f -s .dotfiles/.gitconfig .
cd - 1>/dev/null
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"


echo "(2/4) vundle"
repo=https://github.com/VundleVim/Vundle.vim.git
path=~/.vim/bundle/Vundle.vim
git -C $path pull >/dev/null || git clone $repo $path >/dev/null

echo "(3/4) install vim plugins"
vim +PluginInstall +qall

echo "(4/4) print reminder"
echo "-> pip install flake8 mccabe tox isort virtualenvwrapper"
