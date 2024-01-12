#!/bin/bash

#  Lazygit
if ! type lazygit &> /dev/null; then
  # if not on Raspberry Pi, install lazygit
  if ! cat /proc/device-tree/model | grep -q "Raspberry Pi"; then
    "$HOME/.go/bin/go" install github.com/jesseduffield/lazygit@latest
  fi
fi

#  Gitmux
if ! type gitmux &> /dev/null; then
  "$HOME/.go/bin/go" install github.com/arl/gitmux@latest
fi
