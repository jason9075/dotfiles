#!/bin/bash

# fzf
if ! type fzf &> /dev/null; then
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install --key-bindings --completion --no-bash --no-zsh --no-fish
fi

if [ "$(uname)" = "Linux" ]; then
  ln -s $(which fdfind) ~/.local/bin/fd
  ln -s /usr/bin/batcat ~/.local/bin/bat
fi
