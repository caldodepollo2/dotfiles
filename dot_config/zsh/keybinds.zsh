# Keybinds
bindkey -e

bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line
bindkey "\e[H"  beginning-of-line
bindkey "\e[F"  end-of-line

bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word
bindkey "^[[1;3D" backward-word
bindkey "^[[1;3C" forward-word

bindkey "^[[3~"   delete-char
bindkey "^H"      backward-kill-word
bindkey "^[[3;5~" kill-word

bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down

bindkey "^R"   history-incremental-search-backward
