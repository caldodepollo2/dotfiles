# Aliases
alias l='eza --icons --group-directories-first'
alias ls='eza -a --icons --group-directories-first'
alias ll='eza -lh --icons --group-directories-first'
alias la='eza -lah --icons --group-directories-first'
alias tree='eza --tree --icons'

alias cat='bat --paging=never'
alias calendar='cal -y --monday'
alias grep='grep --color=auto'
alias df='df -h'
alias du='du -h'
alias free='free -h'
alias mkdir='mkdir -pv'

alias ..='cd ..'
alias ...='cd ../..'

alias update='sudo pacman -Syu && yay -Syu && yay -Yc && sudo bootctl update'

alias virtualbox='QT_QPA_PLATFORM=xcb QT_STYLE_OVERRIDE=kvantum exec /usr/bin/virtualbox "$@"'
