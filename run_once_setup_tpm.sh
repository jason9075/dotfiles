#!/bin/sh

if [ -d ~/.tmux/plugins/tpm ]; then
  echo '\033[1;30mTPM has been installed, skip installation.\033[1;30m'
  exit 0
fi

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
