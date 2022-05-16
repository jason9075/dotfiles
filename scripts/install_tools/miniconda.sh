#!/bin/bash

if [ -d "$HOME/miniconda3" ]; then
  echo 'miniconda has been installed, skip installation.'
  exit 0
fi

if type apt-get &> /dev/null; then
  curl "https://repo.continuum.io/miniconda/Miniconda-latest-Linux-x86_64.sh" -o ~/Miniconda_Install.sh
  ~/Miniconda_Install.sh -b -p ~/miniconda3 
  rm ~/Miniconda_Install.sh
elif type brew &> /dev/null; then
  curl "https://repo.continuum.io/miniconda/Miniconda-latest-MacOSX-x86_64.sh" -o ~/Miniconda_Install.sh
  ~/Miniconda_Install.sh -b -p ~/miniconda3 
  rm ~/Miniconda_Install.sh
fi

