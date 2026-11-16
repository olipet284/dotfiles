case $- in *i*) ;; *) return ;; esac
if [ -r "${XDG_CONFIG_HOME:-$HOME/.config}/shell/loader.sh" ]; then
  . "${XDG_CONFIG_HOME:-$HOME/.config}/shell/loader.sh"
fi
