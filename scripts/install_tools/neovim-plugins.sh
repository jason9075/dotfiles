
echo 'Setting up neovim plugins...'

# install tree-sitter-cli for nvim plugin
npm install tree-sitter-cli

# install neovim
NVIM_CONFIG_DIR="$HOME/.config/nvim"
mkdir -p "$HOME/.config"
ln -s $HOME/dotfiles/nvim $NVIM_CONFIG_DIR
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

