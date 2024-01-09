#!/bin/bash

# check git name and email
if git config --global user.name &> /dev/null; then
  echo 'git has been configured, skip configuration.'
  exit 0
fi

GIT_NAME=${GIT_NAME:-"jason9075"}
GIT_MAIL=${GIT_MAIL:-"jason9075@users.noreply.github.com"}

git config --global user.name ${GIT_NAME}
git config --global user.email ${GIT_MAIL}
git config --global core.editor nvim
git config --global init.defaultBranch master

"$HOME/.go/bin/go" install github.com/jesseduffield/lazygit@latest
