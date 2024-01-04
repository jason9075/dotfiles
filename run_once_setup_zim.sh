#!/bin/sh

if [ -d ~/.zim ]; then
  echo 'zim has been installed, skip installation.'
  exit 0
fi

zsh ~/.zim/zimfw.zsh install
