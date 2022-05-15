#!/bin/bash

GIT_NAME=${GIT_NAME:-"jason9075"}
GIT_MAIL=${GIT_MAIL:-"jason9075@gmail.com"}

install() {
    for INSTALL_SCRIPT in ~/dotfiles/scripts/install_steps/*.sh; do
        bash ${INSTALL_SCRIPT}
    done
}

setup_zsh() {
  echo 'Setting up zsh...'

  ln -s $HOME/dotfiles/zsh/zim/zshenv $HOME/.zshenv
  ln -s $HOME/dotfiles/zsh/zim/zlogin $HOME/.zlogin
  ln -s $HOME/dotfiles/zsh/zim/zimrc $HOME/.zimrc
  ln -s $HOME/dotfiles/zsh/zim/zshrc $HOME/.zshrc
  ln -s $HOME/dotfiles/zsh/zim/p10k.zsh $HOME/.p10k.zsh

  echo 'Installing zsh modules...'
  zsh ~/.zim/zimfw.zsh install

  echo 'zsh is ready!'
}

setup_neovim() {
  echo 'Setting up neovim...'
  # install tree-sitter-cli for nvim plugin
  npm install tree-sitter-cli

  # install neovim
  NVIM_CONFIG_DIR="$HOME/.config/nvim"
  mkdir -p "$HOME/.config"
  ln -s $HOME/dotfiles/nvim $NVIM_CONFIG_DIR
  nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

  echo 'neovim is ready!'
}

install
setup_zsh
setup_neovim

echo 'All done!'
