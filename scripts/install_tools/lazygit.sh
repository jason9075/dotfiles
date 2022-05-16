if type lazygit &> /dev/null; then
  echo 'lazygit has been installed, skip installation.'
  exit 0
fi

go install github.com/jesseduffield/lazygit@latest
