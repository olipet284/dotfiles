if command -v code >/dev/null 2>&1; then export EDITOR="${EDITOR:-code --wait}"; fi
export EDITOR="${EDITOR:-vi}"
export SUDO_EDITOR="${SUDO_EDITOR:-$EDITOR}"
export TERMINAL="${TERMINAL:-ghostty}"
