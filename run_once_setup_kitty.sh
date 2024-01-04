#!/bin/bash

if type kitty &> /dev/null; then
  echo 'kitty has been installed, skip installation.'
  exit 0
fi

curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
