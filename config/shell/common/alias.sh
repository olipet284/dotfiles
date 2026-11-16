alias c='clear'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
compress() {
  [ "$#" -eq 1 ] || { printf 'Usage: compress <path>\n' >&2; return 1; }
  tar -czf "${1%/}.tar.gz" -- "${1%/}"
}
alias decompress='tar -xzf'
if command -v eza >/dev/null 2>&1; then
  alias ls='eza -lh --group-directories-first --icons=auto --color'
  alias lsa='ls -a'
  alias lt='eza --tree --level=2 --long --icons --git'
  alias lta='lt -a'
fi
if command -v fzf >/dev/null 2>&1; then
  if [ -x "$(command -v bat)" ]; then
    alias ff="fzf --preview 'bat --style=numbers --color=always {}'"
  elif command -v batcat >/dev/null 2>&1; then
    alias ff="fzf --preview 'batcat --style=numbers --color=always {}'"
  else
    alias ff='fzf'
  fi
fi
if ! command -v fd >/dev/null 2>&1 && command -v fdfind >/dev/null 2>&1; then alias fd='fdfind'; fi
if ! command -v bat >/dev/null 2>&1 && command -v batcat >/dev/null 2>&1; then alias bat='batcat'; fi
if command -v docker >/dev/null 2>&1; then alias d='docker'; fi
if command -v rails >/dev/null 2>&1; then alias r='rails'; fi
if command -v lazygit >/dev/null 2>&1; then alias lzg='lazygit'; fi
if command -v lazydocker >/dev/null 2>&1; then alias lzd='lazydocker'; fi
if command -v tree >/dev/null 2>&1; then
  alias tree='tree -f -I "bin|.venv|.git"'
  alias dir-tree='tree -P "*.[ch]|*.[ch]pp"'
fi
if command -v nvim >/dev/null 2>&1; then
  n() { if [ "$#" -eq 0 ]; then nvim .; else nvim "$@"; fi; }
fi
if command -v git >/dev/null 2>&1; then
  alias g='git'
  alias gcm='git commit -m'
  alias gcam='git commit -a -m'
  alias gcad='git commit -a --amend'
fi
if command -v fastfetch >/dev/null 2>&1; then alias fetch='fastfetch'; fi
