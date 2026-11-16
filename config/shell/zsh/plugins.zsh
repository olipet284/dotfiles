# Execute with `zsh -df <this-file> install` to prefetch; sourcing loads caches only.
_dotfiles_shell_plugins() {
  local mode=$1 plugin snippet cache
  local zinit_home="${XDG_DATA_HOME:-$HOME/.local/share}/zinit/zinit.git"
  if [[ -r "$zinit_home/zinit.zsh" ]]; then
    source "$zinit_home/zinit.zsh" || return
    # ponytail: guards follow Zinit's cache layout; update them if upstream changes it.
    for snippet in git sudo kubectl kubectx command-not-found; do
      cache="${ZINIT[SNIPPETS_DIR]}/OMZP::$snippet"
      if [[ "$mode" == install ]]; then
        zinit ice cloneonly nocompletions
        zinit snippet "OMZP::$snippet" || return
        [[ -s "$cache/OMZP::$snippet" && -d "$cache/._zinit" ]] || {
          print -u2 "error: Zinit failed to cache $snippet"; return 1
        }
      elif [[ -s "$cache/OMZP::$snippet" && -d "$cache/._zinit" ]]; then
        zinit snippet "OMZP::$snippet"
      fi
    done
    for plugin in zsh-users/zsh-completions Aloxaf/fzf-tab \
      zsh-users/zsh-autosuggestions zsh-users/zsh-syntax-highlighting; do
      if [[ "$mode" != install && "$plugin" == Aloxaf/fzf-tab ]]; then
        autoload -Uz compinit
        compinit -i
        zinit cdreplay -q
      fi
      if [[ "$mode" == install ]]; then
        zinit ice cloneonly nocompletions depth=1
        zinit light "$plugin" || return
        [[ -d "${ZINIT[PLUGINS_DIR]}/${plugin//\//---}/.git" ]] || {
          print -u2 "error: Zinit failed to cache $plugin"; return 1
        }
      elif [[ -d "${ZINIT[PLUGINS_DIR]}/${plugin//\//---}/.git" ]]; then
        [[ "$plugin" != Aloxaf/fzf-tab ]] || command -v fzf >/dev/null 2>&1 || continue
        zinit light "$plugin"
      fi
    done
  elif [[ "$mode" == install ]]; then
    print -u2 "error: Zinit is missing at $zinit_home"; return 1
  else
    autoload -Uz compinit
    compinit -i
  fi
}
if [[ "$ZSH_EVAL_CONTEXT" == toplevel && "${1:-}" == install ]]; then
  _dotfiles_shell_plugins install || { unfunction _dotfiles_shell_plugins; return 1; }
else
  _dotfiles_shell_plugins load || { unfunction _dotfiles_shell_plugins; return 1; }
fi
unfunction _dotfiles_shell_plugins
