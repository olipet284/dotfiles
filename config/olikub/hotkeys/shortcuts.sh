# Custom GNOME shortcuts: add one call per shortcut.
TERMINAL=ghostty
WORK_BROWSER=firefox
PERSONAL_BROWSER=brave-browser

# OS
add_custom_keybinding 'Ulauncher' 'sh -c "pgrep -x ulauncher && { ulauncher-toggle || true; } || setsid -f ulauncher"' '<Alt>space'
add_custom_keybinding 'Flameshot' 'sh -c -- "flameshot gui"' '<Control>Print'
add_custom_keybinding 'Choose Olikub Theme' "$TERMINAL -e bash -ic 'olikub theme'" '<Shift><Super>t'
add_custom_keybinding 'Lock Screen' 'loginctl lock-session' '<Control><Super>l'
add_custom_keybinding 'New Terminal Window' "$TERMINAL" '<Super>Return'

# Applications
## Browser
add_custom_keybinding 'New Work Browser Window' "$WORK_BROWSER --new-window" '<Shift><Super>b'
add_custom_keybinding 'New Personal Browser Window' "sh -c -- 'if command -v $PERSONAL_BROWSER >/dev/null 2>&1; then exec $PERSONAL_BROWSER --new-window; elif command -v brave >/dev/null 2>&1; then exec brave --new-window; else exec flatpak run com.brave.Browser --new-window; fi'" '<Shift><Super><Alt>b'
add_custom_keybinding 'Open Work Calendar' "$WORK_BROWSER https://outlook.cloud.microsoft/calendar/view/workweek" '<Shift><Super>c'
add_custom_keybinding 'Open Personal Calendar' "sh -c -- 'if command -v $PERSONAL_BROWSER >/dev/null 2>&1; then exec $PERSONAL_BROWSER --new-window https://calendar.google.com/calendar/u/0/r; elif command -v brave >/dev/null 2>&1; then exec brave --new-window https://calendar.google.com/calendar/u/0/r; else exec flatpak run com.brave.Browser --new-window https://calendar.google.com/calendar/u/0/r; fi'" '<Shift><Super><Alt>c'
add_custom_keybinding 'Open Work Email' "$WORK_BROWSER https://outlook.cloud.microsoft/mail/" '<Shift><Super>e'
add_custom_keybinding 'Open Personal Email' "sh -c -- 'if command -v $PERSONAL_BROWSER >/dev/null 2>&1; then exec $PERSONAL_BROWSER --new-window https://mail.google.com/mail/u/0/; elif command -v brave >/dev/null 2>&1; then exec brave --new-window https://mail.google.com/mail/u/0/; else exec flatpak run com.brave.Browser --new-window https://mail.google.com/mail/u/0/; fi'" '<Shift><Super><Alt>e'
add_custom_keybinding 'Open YouTube (work profile)' "$WORK_BROWSER https://www.youtube.com/" '<Shift><Super>y'
add_custom_keybinding 'Open YouTube (personal profile)' "sh -c -- 'if command -v $PERSONAL_BROWSER >/dev/null 2>&1; then exec $PERSONAL_BROWSER --new-window https://www.youtube.com/; elif command -v brave >/dev/null 2>&1; then exec brave --new-window https://www.youtube.com/; else exec flatpak run com.brave.Browser --new-window https://www.youtube.com/; fi'" '<Shift><Super><Alt>y'
add_custom_keybinding 'Open Slack' "$WORK_BROWSER https://sallinggroup.slack.com/" '<Shift><Super>s'
add_custom_keybinding 'Open Teams' "$WORK_BROWSER https://teams.microsoft.com/" '<Shift><Super><Alt>t'
## Editors
add_custom_keybinding 'Open Obsidian' 'sh -c -- "if [ -x /opt/Obsidian/obsidian ]; then exec /opt/Obsidian/obsidian; elif command -v obsidian >/dev/null 2>&1; then exec obsidian; else exec gtk-launch obsidian.desktop; fi"' '<Shift><Super>o'
add_custom_keybinding 'Open Marktext' 'sh -c -- "if command -v marktext >/dev/null 2>&1; then exec marktext; else exec gtk-launch marktext.desktop; fi"' '<Shift><Super>n'
add_custom_keybinding 'Open Neovim' "$TERMINAL -e nvim" '<Shift><Super><Alt>n'
add_custom_keybinding 'Open VS Code' 'code' '<Shift><Super>v'
add_custom_keybinding 'Open VS Code Agent Window' 'code --new-window' '<Shift><Super><Alt>v'
## Files
add_custom_keybinding 'Open File Explorer' 'nautilus' '<Shift><Super><Alt>f'
add_custom_keybinding 'Open Yazi' 'yazi' '<Shift><Super>f'

# Settings
add_custom_keybinding 'Open Bluetooth Settings' 'gnome-control-center bluetooth' '<Control><Super>b'
add_custom_keybinding 'Open Display Settings' 'gnome-control-center display' '<Primary><Super>d'
add_custom_keybinding 'Open Power Settings' 'gnome-control-center power' '<Control><Super>p'
add_custom_keybinding 'Open WiFi Settings' 'gnome-control-center wifi' '<Control><Super>w'
add_custom_keybinding 'Open Audio Settings' 'gnome-control-center sound' '<Control><Super>a'
