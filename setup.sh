#!/bin/bash

GIT_NAME=${GIT_NAME:-"jason9075"}
GIT_MAIL=${GIT_MAIL:-"jason9075@gmail.com"}

install() {
    for INSTALL_SCRIPT in ~/dotfiles/scripts/install/*.sh; do
        bash ${INSTALL_SCRIPT}
    done
}

install

echo 'All done!'
