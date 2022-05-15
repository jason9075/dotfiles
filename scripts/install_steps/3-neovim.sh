echo 'installing neovim '

if type nvim &> /dev/null; then
  echo 'neovim has been installed, skip installation.'
  exit 0
fi

bash $HOME/dotfiles/scripts/install_tools/neovim.sh
mkdir -p $HOME/.config
ln -s $HOME/dotfiles/nvim $HOME/.config/nvim
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

echo 'neovim is ready!'
