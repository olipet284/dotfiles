#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
config_home="${XDG_CONFIG_HOME:-$HOME/.config}"
backup_root="$HOME/.dotfiles-backup"
backup_dir=

link_file() {
  local source=$1 destination=$2 backup_relative=$3 backup_target

  mkdir -p "$(dirname -- "$destination")"
  if [[ -L "$destination" && "$(readlink "$destination")" == "$source" ]]; then
    return
  fi

  if [[ -e "$destination" || -L "$destination" ]]; then
    if [[ -z "$backup_dir" ]]; then
      mkdir -p "$backup_root"
      backup_dir="$(mktemp -d "$backup_root/$(date +%Y%m%d-%H%M%S).XXXXXX")"
    fi
    backup_target="$backup_dir/$backup_relative"
    mkdir -p "$(dirname -- "$backup_target")"
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
      link_file "$source" "$config_home/$relative" "config/$relative"
    fi
  done
}

shopt -s nullglob dotglob
link_file "$repo_root/.bashrc" "$HOME/.bashrc" .bashrc
link_file "$repo_root/.zshrc" "$HOME/.zshrc" .zshrc
install_config_tree "$repo_root/config"

if [[ -n "$backup_dir" ]]; then
  printf 'Existing files are preserved in %s\n' "$backup_dir"
fi
