if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

export EDITOR='nvim'
export VISUAL='nvim'
export PAGER='less'

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi
if [[ -z "$LC_ALL" ]]; then
  export LC_ALL='en_US.UTF-8'
fi

# Paths
# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the list of directories that Zsh searches for programs.
path=(
  $HOME/.bin
  /usr/local/opt/gnu-getopt/bin
  /usr/local/opt/coreutils/libexec/gnubin
  /usr/local/opt/fzf/bin
  /usr/local/opt/gettext/bin
  /usr/local/{bin,sbin}
  $HOME/Library/Python/3.7/bin
  $HOME/.linkerd2/bin
  $path
)

export LESS='-F -g -i -M -R -S -w -X -z-4'
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

export PYPI_USERNAME="$(pass pypi-artifactory | sed -nE 's/^username: (.*)$/\1/p')"
export PYPI_PASSWORD="$(pass pypi-artifactory | head -1)"
