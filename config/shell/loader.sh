_dotfiles_shell_load() {
  local _dotfiles_root="${XDG_CONFIG_HOME:-$HOME/.config}/shell"
  local _dotfiles_fragment _dotfiles_kind
  if [ -n "${ZSH_VERSION:-}" ]; then
    setopt localoptions nonomatch
    _dotfiles_kind=zsh
  elif [ -n "${BASH_VERSION:-}" ]; then
    _dotfiles_kind=bash
  else
    return 0
  fi
  for _dotfiles_fragment in "$_dotfiles_root/common/"*.sh \
    "$_dotfiles_root/$_dotfiles_kind/"*."$_dotfiles_kind"; do
    [ -f "$_dotfiles_fragment" ] && [ -r "$_dotfiles_fragment" ] || continue
    . "$_dotfiles_fragment"
  done
}
_dotfiles_shell_load
unset -f _dotfiles_shell_load
