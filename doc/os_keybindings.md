# OS shortcut

## Ubuntu

Set shortcut for changing workspace:

```bash
dconf write /org/gnome/mutter/dynamic-workspaces false
dconf write /org/gnome/desktop/wm/preferences/num-workspaces 4

dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-1 "['<Alt>1']"
dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-2 "['<Alt>2']"
dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-3 "['<Alt>3']"
dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-4 "['<Alt>4']"

dconf write /org/gnome/desktop/wm/keybindings/move-to-workspace-1 "['<Alt><Shift>1']"
dconf write /org/gnome/desktop/wm/keybindings/move-to-workspace-2 "['<Alt><Shift>2']"
dconf write /org/gnome/desktop/wm/keybindings/move-to-workspace-3 "['<Alt><Shift>3']"
dconf write /org/gnome/desktop/wm/keybindings/move-to-workspace-4 "['<Alt><Shift>4']"
```

Other keybindings
| Key | Description |
| ----------- | ----------- |
| Super + A | show all apps |
| Super + T | open term |
| Super + D | show all workspace |
| Super + Ctrl + ←/→ | squish windows to half |

## Mac OS

Go to keyboard setting and choose missing control. Default setting is ctrl + number.

You can change it to use command + number.

# Ref

[Ubuntu keybindings](https://wiki.ubuntu.com/Keybindings)
