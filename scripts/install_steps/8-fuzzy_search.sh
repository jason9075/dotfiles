
# fzf
if ! type fzf &> /dev/null; then
  if type pkg &> /dev/null; then
    pkg install -y fzf
  elif type apt-get &> /dev/null; then
    sudo apt install -y fzf
  elif type brew &> /dev/null; then
    brew install fzf 
  elif type apk &> /dev/null; then
    apk add fzf
  elif type pacman &> /dev/null; then
    yes | sudo pacman -S fzf
  fi
fi

# fdfind
if ! type fd &> /dev/null; then
  if type pkg &> /dev/null; then
    pkg install -y fd-find
  elif type apt-get &> /dev/null; then
    sudo apt install -y fd-find
  elif type brew &> /dev/null; then
    brew install fd 
  elif type apk &> /dev/null; then
    apk add fd
  elif type pacman &> /dev/null; then
    yes | sudo pacman -S fd
  fi
fi

# bat
if ! type bat &> /dev/null; then
  if type pkg &> /dev/null; then
    pkg install -y bat
  elif type apt-get &> /dev/null; then
    sudo apt install -y bat
  elif type brew &> /dev/null; then
    brew install bat 
  elif type apk &> /dev/null; then
    apk add bat
  elif type pacman &> /dev/null; then
    yes | sudo pacman -S bat
  fi
fi

# tree
if ! type tree &> /dev/null; then
  if type pkg &> /dev/null; then
    pkg install -y tree
  elif type apt-get &> /dev/null; then
    sudo apt install -y tree
  elif type brew &> /dev/null; then
    brew install tree 
  elif type apk &> /dev/null; then
    apk add tree
  elif type pacman &> /dev/null; then
    yes | sudo pacman -S tree
  fi
fi
