#!/bin/bash

if type lazygit &> /dev/null; then
  echo 'lazygit has been installed, skip installation.'
  exit 0
fi

# if this is raspberry, ignore insatll
if cat /proc/device-tree/model | grep -q "Raspberry Pi"; then
  echo 'This is Raspberry Pi, skip installation.'
  exit 0
fi

"$HOME/.go/bin/go" install github.com/jesseduffield/lazygit@latest
