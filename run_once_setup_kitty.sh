#!/bin/bash

if type kitty &> /dev/null; then
  echo '\033[1;30mkitty has been installed, skip installation.\033[0m'
  exit 0
fi

if [ "$(uname)" = "Linux" ]; then
    KITTY_PATH=$HOME/.local/kitty.app/bin/kitty
  elif [ "$(uname)" = "Darwin" ]; then
    KITTY_PATH=/Applications/kitty.app/Contents/MacOS/kitty
  else
    echo 'kitty not support this platform.'
    exit 0
fi

# install kitty
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

ln -s $KITTY_PATH $HOME/.local/bin/
