#!/bin/bash

GIT_NAME=${GIT_NAME:-"jason9075"}
GIT_MAIL=${GIT_MAIL:-"jason9075@users.noreply.github.com"}

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
  echo 'Installing nvim plugins'
  bash $HOME/dotfiles/scripts/install_tools/neovim-plugins.sh

  # setup config 
  NVIM_CONFIG_DIR="$HOME/.config/nvim"
  mkdir -p "$HOME/.config"
  ln -s $HOME/dotfiles/nvim $NVIM_CONFIG_DIR
  "$HOME/.local/bin/nvim" --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

  echo 'neovim is ready!'
}

setup_git() {
  echo 'Setting up git...'

  git config --global user.name ${GIT_NAME}
  git config --global user.email ${GIT_MAIL}
  git config --global core.editor nvim
  git config --global init.defaultBranch master

  bash $HOME/dotfiles/scripts/install_tools/lazygit.sh

  echo 'git is ready!'
}

setup_dev_tools() {
  echo 'Setting up dev tools...'

  bash $HOME/dotfiles/scripts/install_tools/dev_tools.sh

  echo 'dev tools is ready!'
}

install
setup_zsh
setup_neovim
setup_git
setup_dev_tools

echo 'All done!'
