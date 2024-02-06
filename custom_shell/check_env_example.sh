#!/bin/bash

if [ ! -f .env ]; then
  exit 0
fi

ENV_FILE_KEY=$(grep -v -e '^#' -e '^$' .env | cut -d= -f1 | sort)
ENV_EXAMPLE_FILE_KEY=$(grep -v -e '^#' -e '^$' .env-example | cut -d= -f1 | sort)

diff <(echo "$ENV_FILE_KEY") <(echo "$ENV_EXAMPLE_FILE_KEY") > /dev/null

if [ $? -ne 0 ]; then
  echo "Error: .env and .env-example files do not match!"
  exit 1
fi
