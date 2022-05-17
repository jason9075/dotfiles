#!/bin/bash

if type apt-get &> /dev/null; then
  ln -s $(which fdfind) ~/.local/bin/fd
  ln -s /usr/bin/batcat ~/.local/bin/bat
# elif type brew &> /dev/null; then
#   brew install fzf
fi

