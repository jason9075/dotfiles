# Zim 
curl -fsSL 'https://raw.githubusercontent.com/zimfw/install/master/install.zsh' | zsh
rm $HOME/.zshenv $HOME/.zshrc $HOME/.zlogin $HOME/.zimrc

ln -s $HOME/dotfiles/zsh/zim/zshenv $HOME/.zshenv
ln -s $HOME/dotfiles/zsh/zim/zlogin $HOME/.zlogin
ln -s $HOME/dotfiles/zsh/zim/zimrc $HOME/.zimrc
ln -s $HOME/dotfiles/zsh/zim/zshrc $HOME/.zshrc
ln -s $HOME/dotfiles/zsh/zim/p10k.zsh $HOME/.p10k.zsh
zsh ~/.zim/zimfw.zsh install

# Neovim
mkdir -p "${HOME}/.local/bin"
curl -L "https://github.com/neovim/neovim/releases/latest/download/nvim.appimage" -o "${HOME}/.local/bin/nvim"
chmod u+x "${HOME}/.local/bin/nvim"
ln -s $HOME/dotfiles/vim/vimrc $HOME/.vimrc

# FZF
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --key-bindings --completion --no-bash --no-zsh --no-fish

# Tmux
ln -s $HOME/dotfiles/tmux/tmux.conf $HOME/.tmux.conf

