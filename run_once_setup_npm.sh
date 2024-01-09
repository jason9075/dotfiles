#!/bin/bash

if type tree-sitter &> /dev/null; then
  echo 'npm plugins has been installed, skip installation.'
  exit 0
fi

npm install tree-sitter-cli
npm install --save-dev --save-exact prettier
