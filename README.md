# dotfiles

My personal dotfiles configuration for Bash and Zsh. Shared settings live in `config/shell/common`; shell-specific settings live in `config/shell/bash` and `config/shell/zsh`. Add private or work-specific files alongside them under `~/.config/shell`.

Set up the startup files and all config with one command from the repository root:

```bash
./setup.sh
```

The installer links `.bashrc`, `.zshrc`, and each file under `config/` into `${XDG_CONFIG_HOME:-$HOME/.config}`. It is safe to rerun. Conflicting existing files are renamed in place with a `-BAK-YYYYMMDD-HHMMSS` suffix before linking.

GNOME custom shortcuts are in `config/olikub/hotkeys/`. Olikub reads each `*.sh` file in that directory when applying its hotkeys; add shortcuts with `add_custom_keybinding 'Name' 'command' '<Binding>'`. (See [my personal Omakub fork](https://github.com/olipet284/olikub)).
