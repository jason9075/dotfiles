#!/bin/bash

# check Hack font install
# https://github.com/ryanoasis/nerd-fonts#option-5-clone-the-repo
if ! fc-list | grep "Hack Regular Nerd Font" &> /dev/null; then  
  git clone --filter=blob:none --sparse https://github.com/ryanoasis/nerd-fonts.git ~/nerd-fonts
  cd ~/nerd-fonts
  git sparse-checkout add patched-fonts/Hack
  ./install.sh Hack
  cd ~/
  rm -rf ~/nerd-fonts
fi
