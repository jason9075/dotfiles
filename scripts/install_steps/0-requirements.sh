# git
if ! type git &> /dev/null; then
  if type pkg &> /dev/null; then
    pkg install -y git
  elif type apt-get &> /dev/null; then
    sudo apt install -y git
  elif type brew &> /dev/null; then
    brew install git
  elif type apk &> /dev/null; then
    apk add git
  elif type pacman &> /dev/null; then
    yes | sudo pacman -S git
  fi
fi

# curl
if ! type curl &> /dev/null; then
  if type pkg &> /dev/null; then
    pkg install -y curl
  elif type apt-get &> /dev/null; then
    sudo apt install -y curl
  elif type apk &> /dev/null; then
    apk add curl
  elif type pacman &> /dev/null; then
    yes | sudo pacman -S curl
  fi
fi

# unzip
if ! type unzip &> /dev/null; then
  if type pkg &> /dev/null; then
    pkg install -y unzip
  elif type apt-get &> /dev/null; then
    sudo apt install -y unzip
  elif type apk &> /dev/null; then
    apk add unzip
  elif type pacman &> /dev/null; then
    yes | sudo pacman -S unzip
  fi
fi
