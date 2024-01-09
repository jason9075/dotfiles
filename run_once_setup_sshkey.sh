#!/bin/bash

read -p "Do you want to copy ansible-jasonkuan public ssh key to this device? (Y/n) " -n 1 -r

if [[ $REPLY =~ ^[Nn]$ ]]
then
    exit 0
fi

echo "Copying ssh key..."
ansible-playbook ~/.bootstrap/ssh_key.yml --ask-vault-pass

