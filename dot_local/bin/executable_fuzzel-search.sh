#!/usr/bin/env zsh

setopt pipefail

query=$(fuzzel --dmenu --prompt="Search: " --lines=0 --width=40)
[[ -z $query ]] && exit 0

encoded_query=${query// /+}

librewolf --new-tab "https://duckduckgo.com/?q=$encoded_query" >/dev/null 2>&1 &
