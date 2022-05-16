echo 'installing golan '

if type go &> /dev/null; then
  echo 'golang has been installed, skip installation.'
  exit 0
fi

# ref: https://github.com/canha/golang-tools-install-script
curl -L https://git.io/vQhTU | bash

echo 'golang is installed!'
