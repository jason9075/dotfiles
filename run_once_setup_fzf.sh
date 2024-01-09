#!/bin/bash

# fzf
if type fzf &> /dev/null; then
  echo 'fzf has been installed, skip installation.'
  exit 0
fi

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --key-bindings --completion --no-bash --no-zsh --no-fish

if [ "$(uname)" = "Linux" ]; then
  # check symbolic link
  if [ ! -e ~/.local/bin/fd ]; then
    ln -s $(which fdfind) ~/.local/bin/fd
  fi
  if [ ! -e ~/.local/bin/bat ]; then
    ln -s $(which batcat) ~/.local/bin/bat
  fi
fi
