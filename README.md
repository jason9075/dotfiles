# Dotfiles

## Chezmoi Setup

```bash
export GITHUB_USERNAME=jason9075
cd ~
sh -c "$(curl -fsLS get.chezmoi.io/lb)" -- init --apply $GITHUB_USERNAME
```

Dev setup

```bash
sh -c "$(curl -fsLS get.chezmoi.io/lb)"
.local/bin/chezmoi init https://github.com/jason9075/dotfiles.git --branch dev
.local/bin/chezmoi apply
```

Apply your workspace setting to Chezmoi space

```bash
chezmoi re-add
```

Apply Chezmoi space to your workspace

```bash
chezmoi apply
```

Pull latest Chezmoi from repo and apply to workspace

```bash
chezmoi update
```

## Misc

If you want to change default bash to zsh, use:

```bash
chsh -s $(which zsh)
```

If you need to set user password, use:

```bash
sudo passwd <username>
```

## Ref

```
https://github.com/logandonley/dotfiles/tree/main
```
