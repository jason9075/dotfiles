#!/bin/bash

set -e

install_linux() {
  mkdir -p "${HOME}/.local/bin
  curl -LO "https://github.com/neovim/neovim/releases/latest/download/nvim.appimage" -o "${HOME}/.local/bin/nvim"
  chmod u+x "${HOME}/.local/bin/nvim"
}

install_macos() {
  brew install neovim
}

if [ "$(uname)" = "Linux" ]; then
  install_linux
elif [ "$(uname)" = "Darwin" ]; then
  install_macos
else
  printf "${RED}This installer only support Linux or macOS.${NORMAL}\n"
  exit 1
fi
