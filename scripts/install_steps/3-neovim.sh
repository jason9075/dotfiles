echo 'installing neovim '

if type nvim &> /dev/null; then
  echo 'neovim has been installed, skip installation.'
  exit 0
fi

bash $HOME/dotfiles/scripts/install_tools/neovim.sh

echo 'neovim is installed!'
