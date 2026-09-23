#!/usr/bin/env zsh

setopt pipefail

actions=(
  " Power off"
  " Reboot"
  " Suspend"
)

option=$(print -rl -- $actions | fuzzel --dmenu --lines=${#actions})
[[ -z $option ]] && exit 0

confirmation=$(print -rl -- "Yes" "No" \
  | fuzzel --dmenu --prompt="¿${option}?" --lines=2)

[[ $confirmation != "Yes" ]] && exit 0

print -r -- "OPTION=<$option>"
print -rl -- ${(qq)option}

case $option in
  " Power off") systemctl poweroff ;;
  " Reboot") systemctl reboot ;;
  " Suspend") systemctl suspend ;;
esac
