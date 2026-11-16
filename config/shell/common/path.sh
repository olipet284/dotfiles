for _dotfiles_directory in "$HOME/.local/bin" "$HOME/.tfenv/bin" "$HOME/.opencode/bin"; do
  if [ -d "$_dotfiles_directory" ]; then
    case ":$PATH:" in
      *:"$_dotfiles_directory":*) ;;
      *) export PATH="$_dotfiles_directory:$PATH" ;;
    esac
  fi
done
unset _dotfiles_directory
[ ! -r "$HOME/.cargo/env" ] || . "$HOME/.cargo/env"
