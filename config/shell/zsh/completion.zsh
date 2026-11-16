zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'
[[ ! -r "$HOME/.fzf.zsh" ]] || source "$HOME/.fzf.zsh"
if command -v cortex >/dev/null 2>&1 && [[ -r "$HOME/.zsh/completions/cortex.zsh" ]]; then
  source "$HOME/.zsh/completions/cortex.zsh"
fi
