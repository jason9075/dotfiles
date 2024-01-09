#!/bin/bash

if type lazygit &> /dev/null; then
  echo 'lazygit has been installed, skip installation.'
  exit 0
fi

# if this is rasbian, ignore insatll
if [ -f /etc/os-release ]; then
  . /etc/os-release
  if [ "$ID" = "raspbian" ]; then
    echo 'raspbian detected, skip installation.'
    exit 0
  fi
fi

"$HOME/.go/bin/go" install github.com/jesseduffield/lazygit@latest
