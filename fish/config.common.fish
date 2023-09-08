set -gx EDITOR nvim
set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"

set -gx NNN_TRASH 1
set -gx NNN_OPTS adeAH

# preview-tui will only work in tmux, not iterm without tmux
set -gx NNN_PLUG 'm:mocq;z:autojump;p:preview-tui'

# for some reason macos curl stopped working
set -gx HOMEBREW_FORCE_BREWED_CURL 1

set -g fish_greeting

alias lg=lazygit

fish_vi_key_bindings

bind yy fish_clipboard_copy
bind Y fish_clipboard_copy
bind p fish_clipboard_paste

zoxide init fish | source
starship init fish | source
