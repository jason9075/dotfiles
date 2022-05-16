if type apt-get &> /dev/null; then
  sudo apt install -y htop 
  sudo apt install -y ripgrep 
  sudo apt install -y tig 
  sudo apt install -y tmux 
  sudo apt install -y fzf 
elif type brew &> /dev/null; then
  brew install htop
  brew install ripgrep
  brew install tig
  brew install tmux
  brew install fzf
