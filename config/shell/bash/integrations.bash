if command -v mise >/dev/null 2>&1; then eval "$(mise activate bash)"; fi
if command -v zoxide >/dev/null 2>&1; then eval "$(zoxide init --cmd cd bash)"; fi
if command -v fzf >/dev/null 2>&1; then
  for _dotfiles_fzf in /usr/share/bash-completion/completions/fzf \
    /usr/share/doc/fzf/examples/key-bindings.bash; do
    [[ ! -r "$_dotfiles_fzf" ]] || source "$_dotfiles_fzf"
  done
  unset _dotfiles_fzf
fi
if command -v wt >/dev/null 2>&1; then eval "$(wt config shell init bash)"; fi
