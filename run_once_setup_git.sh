#!/bin/bash

# check git name and email
if git config --global user.name &> /dev/null; then
  echo '\033[1;30mgit has been configured, skip configuration.\033[0m'
  exit 0
fi

GIT_NAME=${GIT_NAME:-"jason9075"}
GIT_MAIL=${GIT_MAIL:-"jason9075@users.noreply.github.com"}

git config --global user.name ${GIT_NAME}
git config --global user.email ${GIT_MAIL}
git config --global core.editor nvim
git config --global init.defaultBranch master

# setup delta
git config --global include.path ~/.config/delta/themes.gitconfig
git config --global pager.diff delta
git config --global pager.log delta
git config --global pager.reflog delta
git config --global pager.show delta

