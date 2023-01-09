# Dotfiles

## Linux Install

```
sudo apt install git -y 
git clone https://github.com/jason9075/dotfiles.git ~/dotfiles
~/dotfiles/setup.sh
```

## OS shortcut

### PopOS

Shortcut fot change workspace:
```
dconf write /org/gnome/mutter/dynamic-workspaces false
dconf write /org/gnome/desktop/wm/preferences/num-workspaces 4

dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-1 "['<Alt>1']"
dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-2 "['<Alt>2']"
dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-3 "['<Alt>3']"
dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-4 "['<Alt>4']"
```

### Mac OS

Go to keyboard setting and choose missing control. Default setting is ctrl + number.

You can change it to use command + number.

## Misc

If you want to change default bash to zsh, use:
```
chsh -s $(which zsh)
```

If you need to set user password, use:
```
sudo passwd <username>
```

## Ref

```
https://github.com/jonz94/dotfiles

https://github.com/LunarVim/LunarVim
```
