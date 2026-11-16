if [[ -r /usr/share/bash-completion/bash_completion ]]; then
  source /usr/share/bash-completion/bash_completion
fi
if command -v uv >/dev/null 2>&1; then eval "$(uv generate-shell-completion bash)"; fi
[[ ! -s "$HOME/.bash/completions/cortex.bash" ]] || source "$HOME/.bash/completions/cortex.bash"
