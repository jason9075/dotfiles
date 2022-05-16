if type lazygit &> /dev/null; then
  echo 'lazygit has been installed, skip installation.'
  exit 0
fi

"$HOME/.go/bin/go" install github.com/jesseduffield/lazygit@latest
