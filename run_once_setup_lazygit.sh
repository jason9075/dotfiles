#!/bin/bash

if type lazygit &> /dev/null; then
  echo '\033[1;30mlazygit has been installed, skip installation.\033[0m'
  exit 0
fi

# if this is raspberry, ignore insatll
if cat /proc/device-tree/model | grep -q "Raspberry Pi"; then
  echo '\033[1;30mThis is Raspberry Pi, skip installation.\033[0m'
  exit 0
fi

"$HOME/.go/bin/go" install github.com/jesseduffield/lazygit@latest
