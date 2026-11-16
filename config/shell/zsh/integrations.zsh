if command -v zoxide >/dev/null 2>&1; then eval "$(zoxide init --cmd cd zsh)"; fi
if command -v uv >/dev/null 2>&1; then eval "$(uv generate-shell-completion zsh)"; fi
if command -v wt >/dev/null 2>&1; then eval "$(wt config shell init zsh)"; fi
