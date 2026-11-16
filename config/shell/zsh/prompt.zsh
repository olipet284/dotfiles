if command -v oh-my-posh >/dev/null 2>&1 && [[ -r "${XDG_CONFIG_HOME:-$HOME/.config}/ohmyposh/zen.toml" ]]; then
  eval "$(oh-my-posh init zsh --config "${XDG_CONFIG_HOME:-$HOME/.config}/ohmyposh/zen.toml")"
fi
