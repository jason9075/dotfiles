#fc-list
if ! type fc-list &> /dev/null; then
  if type apt-get &> /dev/null; then
    sudo apt install -y fontconfig
  elif type brew &> /dev/null; then
    brew install fontconfig
  elif type apk &> /dev/null; then
    apk add fontconfig
  elif type pacman &> /dev/null; then
    yes | sudo pacman -S fontconfig
  fi
fi

# check Hack font install
# https://github.com/ryanoasis/nerd-fonts#option-5-clone-the-repo
if ! fc-list | grep "Hack Regular Nerd Font" &> /dev/null; then  
  git clone --filter=blob:none --sparse https://github.com/ryanoasis/nerd-fonts.git ~/nerd-fonts
  cd ~/nerd-fonts
  git sparse-checkout add patched-fonts/Hack
  ./install.sh Hack
  cd ~/
  rm -rf ~/nerd-fonts
fi
