#!/bin/bash

if [ -d "$HOME/miniconda3" ]; then
  echo 'miniconda has been installed, skip installation.'
  exit 0
fi

# get cpu architecture
CPU_ARCH=$(uname -m)

if [ "$(uname)" = "Linux" ]; then
  curl -sL "https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-${CPU_ARCH}.sh" -o ~/Miniconda_Install.sh
elif [ "$(uname)" = "Darwin" ]; then
  curl -sL "https://repo.continuum.io/miniconda/Miniconda3-latest-MacOSX-${CPU_ARCH}.sh" -o ~/Miniconda_Install.sh
else
  echo "Unknown OS"
  exit 0
fi

chmod u+x ~/Miniconda_Install.sh
bash ~/Miniconda_Install.sh -b -p ~/miniconda3 
rm ~/Miniconda_Install.sh
