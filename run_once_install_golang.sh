#!/bin/bash

if type go &> /dev/null; then
  echo '\033[1;30mGolang has been installed, skip installation.\033[0m'
  exit 0
fi

# ref: https://github.com/canha/golang-tools-install-script
curl -L https://git.io/vQhTU | bash

