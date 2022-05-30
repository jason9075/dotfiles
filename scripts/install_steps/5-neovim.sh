echo 'installing neovim '

if type nvim &> /dev/null; then
  echo 'neovim has been installed, skip installation.'
  exit 0
fi

# fuse
if ! type fuse &> /dev/null; then
  if type pkg &> /dev/null; then
    pkg install -y fuse
  elif type apt-get &> /dev/null; then
    sudo apt install -y fuse
    sudo apt install -y xclip
  elif type apk &> /dev/null; then
    apk add fuse
  elif type pacman &> /dev/null; then
    yes | sudo pacman -S fuse
  fi
fi

bash $HOME/dotfiles/scripts/install_tools/neovim.sh

echo 'neovim is installed!'
