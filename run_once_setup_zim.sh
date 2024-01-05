#!/bin/sh

if [ ! -d ~/.zim ]; then
  echo 'zim has been installed, skip installation.'
  exit 0
fi

curl -fsSL 'https://raw.githubusercontent.com/zimfw/install/master/install.zsh' | zsh

zsh ~/.zim/zimfw.zsh install
