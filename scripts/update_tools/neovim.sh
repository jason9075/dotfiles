#!/bin/bash

set -e

install_linux() {
  curl -L "https://github.com/neovim/neovim/releases/latest/download/nvim.appimage" -o "${HOME}/.local/bin/nvim"
}

install_macos() {
  brew install --HEAD neovim
}

if [ "$(uname)" = "Linux" ]; then
  install_linux
elif [ "$(uname)" = "Darwin" ]; then
  install_macos
else
  printf "${RED}This installer only support Linux or macOS.${NORMAL}\n"
  exit 1
fi
