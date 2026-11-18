#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
config_home="${XDG_CONFIG_HOME:-$HOME/.config}"

link_file() {
  local source=$1 destination=$2 backup_target

  mkdir -p "$(dirname -- "$destination")"
  if [[ -L "$destination" && "$(readlink "$destination")" == "$source" ]]; then
    return
  fi

  if [[ -e "$destination" || -L "$destination" ]]; then
    backup_target="$destination-BAK-$(date +%Y%m%d-%H%M%S)"
    if [[ -e "$backup_target" || -L "$backup_target" ]]; then
      printf 'Backup already exists: %s\n' "$backup_target" >&2
      return 1
    fi
    mv -- "$destination" "$backup_target"
    printf 'Backed up %s to %s\n' "$destination" "$backup_target"
  fi

  ln -s "$source" "$destination"
  printf 'Linked %s -> %s\n' "$destination" "$source"
}

install_config_tree() {
  local directory=$1 source relative

  for source in "$directory"/*; do
    [[ -e "$source" || -L "$source" ]] || continue
    if [[ -d "$source" && ! -L "$source" ]]; then
      install_config_tree "$source"
    elif [[ -f "$source" || -L "$source" ]]; then
      relative=${source#"$repo_root/config/"}
      link_file "$source" "$config_home/$relative"
    fi
  done
}

shopt -s nullglob dotglob
link_file "$repo_root/.bashrc" "$HOME/.bashrc"
link_file "$repo_root/.zshrc" "$HOME/.zshrc"
install_config_tree "$repo_root/config"
