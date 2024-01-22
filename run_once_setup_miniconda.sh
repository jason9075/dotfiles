#!/bin/bash

if [ -d "$HOME/miniconda3" ]; then
  echo '\033[1;30mminiconda has been installed, skip installation.\033[1;30m'
  exit 0
fi

# get cpu architecture
CPU_ARCH=$(uname -m)

if [ "$(uname)" = "Linux" ]; then
  curl -sL "https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-${CPU_ARCH}.sh" -o /tmp/Miniconda_Install.sh
elif [ "$(uname)" = "Darwin" ]; then
  curl -sL "https://repo.continuum.io/miniconda/Miniconda3-latest-MacOSX-${CPU_ARCH}.sh" -o /tmp/Miniconda_Install.sh
else
  echo "\033[1;31mUnknown OS, exit.\033[1;30m"
  exit 0
fi

chmod u+x /tmp/Miniconda_Install.sh
bash /tmp/Miniconda_Install.sh -b -p $HOME/miniconda3
