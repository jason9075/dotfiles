#!/bin/sh

if [ -d ~/.zim ]; then
  echo '\033[1;30mZim has been installed, skip installation.\033[1;30m'
  exit 0
fi

curl -fsSL 'https://raw.githubusercontent.com/zimfw/install/master/install.zsh' | zsh
