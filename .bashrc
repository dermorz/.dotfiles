# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [ -f ~/.dotfiles/git-prompt.sh ]; then
    source ~/.dotfiles/git-prompt.sh
fi

if [ -f ~/.dotfiles/git-completion.bash ]; then
    source ~/.dotfiles/git-completion.bash
fi

export EDITOR=vim
export PS1='\[\033[01;34m\]\u\[\033[1;37m\]@\[\033[1;34m\]\h\[\033[01;34m\] \[\033[0;37m\][\[\033[0;32m\]\w\[\033[0;37m\]]\n\[\033[0;33m\]$(__git_ps1 "(%s) ")\[\033[0m\]\$ '
