echo 'installing node...'

if [ $(uname -r | grep -i ish) ]; then
  echo 'installing node via apk'
  apk add nodejs-current nodejs-current-doc npm
  exit 0
fi

if ! type node &> /dev/null; then
  if type pkg &> /dev/null; then
    pkg install -y nodejs npm
  elif type apt-get &> /dev/null; then
    sudo apt install -y nodejs 
  elif type brew &> /dev/null; then
    brew install node 
  elif type pacman &> /dev/null; then
    yes | sudo pacman -S nodejs npm 
  fi
fi
