echo 'installing zim...'

if [ -d ~/.zim ]; then
  echo 'zim has been installed, skip installation.'
  exit 0
fi

curl -fsSL 'https://raw.githubusercontent.com/zimfw/install/master/install.zsh' | zsh

# remove templates provides by zimfw installer
rm $HOME/.zshenv $HOME/.zshrc $HOME/.zlogin $HOME/.zimrc

echo 'zim is ready!'
