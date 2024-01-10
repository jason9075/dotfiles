#!/bin/bash

if type tree-sitter &> /dev/null; then
  echo '\033[1;30mnpm plugins has been installed, skip installation.\033[0m'
  exit 0
fi

npm install tree-sitter-cli
npm install --save-dev --save-exact prettier
