
# install tree-sitter-cli for nvim plugin
npm install tree-sitter-cli


# black
if ! type black &> /dev/null; then
  if type pkg &> /dev/null; then
    pkg install -y black
  elif type apt-get &> /dev/null; then
    sudo apt install -y black
  elif type brew &> /dev/null; then
    brew install black
  elif type apk &> /dev/null; then
    apk add black
  elif type pacman &> /dev/null; then
    yes | sudo pacman -S black
  fi
fi

# flake8
if ! type flake8 &> /dev/null; then
  if type pkg &> /dev/null; then
    pkg install -y flake8
  elif type apt-get &> /dev/null; then
    sudo apt install -y flake8
  elif type brew &> /dev/null; then
    brew install flake8
  elif type apk &> /dev/null; then
    apk add flake8
  elif type pacman &> /dev/null; then
    yes | sudo pacman -S flake8
  fi
fi

# prettier formating
npm install --save-dev --save-exact prettier
