export EDITOR=vim
export WORKON_HOME=~/Workspace/envs
source /usr/local/bin/virtualenvwrapper.sh 2>/dev/null || source /usr/bin/virtualenvwrapper.sh
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
