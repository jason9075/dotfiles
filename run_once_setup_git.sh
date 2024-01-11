#!/bin/bash

if ! git config --global user.email &> /dev/null; then    
    echo "Setting up git"
    GIT_NAME=${GIT_NAME:-"jason9075"}
    GIT_MAIL=${GIT_MAIL:-"jason9075@users.noreply.github.com"}

    git config --global user.name ${GIT_NAME}
    git config --global user.email ${GIT_MAIL}
    git config --global core.editor nvim
    git config --global init.defaultBranch master
fi

# setup delta
git config --global include.path ~/.config/delta/themes.gitconfig
git config --global pager.diff delta
git config --global pager.log delta
git config --global pager.reflog delta
git config --global pager.show delta

git config --global interactive.diffFilter "delta --color-only"

git config --global delta.features mellow-barbet
git config --global delta.side-by-side false
git config --global delta.hunk-header-style "file syntax"
git config --global delta.hunk-header-decoration-style "blue ul"
git config --global delta.plus-emph-style "brightgreen bold italic black"
git config --global delta.plus-style "green black"
git config --global delta.minus-emph-style "red bold italic black"
git config --global delta.minus-style "red black"
git config --global delta.zero-style "gray"
