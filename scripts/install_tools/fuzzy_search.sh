#!/bin/bash

if [ "$(uname)" = "Linux" ]; then
  ln -s $(which fdfind) ~/.local/bin/fd
  ln -s /usr/bin/batcat ~/.local/bin/bat
fi

