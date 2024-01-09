#!/bin/bash

if [ -x "$(command -v ansible)" ]; then
    echo "Ansible is already installed."
    exit 0
fi

install_on_fedora() {
    sudo dnf install -y ansible
}

install_on_ubuntu() {
    sudo apt update
    sudo apt install -y ansible
}

install_on_mac() {
    brew install ansible
}

install_on_debian() {
    sudo apt update
    sudo apt install -y ansible
}

install_on_arch() {
    sudo pacman -S ansible
}

install_on_alpine() {
    sudo apk add ansible
}

install_on_amazon_linux() {
    sudo yum install -y ansible
}

OS="$(uname -s)"
case "${OS}" in
    Linux*)
        if [ -f /etc/fedora-release ]; then
            install_on_fedora
        elif [ -f /etc/lsb-release ]; then
            install_on_ubuntu
        elif [ -f /etc/debian_version ]; then
            install_on_debian
        elif [ -f /etc/arch-release ]; then
            install_on_arch
        elif [ -f /etc/alpine-release ]; then
            install_on_alpine
        elif [ -f /etc/amazon-linux-release ]; then
            install_on_amazon_linux
        else
            echo "Unsupported Linux distribution"
            exit 1
        fi
        ;;
    Darwin*)
        install_on_mac
        ;;
    *)
        echo "Unsupported operating system: ${OS}"
        exit 1
        ;;
esac

ansible-playbook ~/.bootstrap/setup.yml --ask-become-pass

echo "Ansible installation complete."
