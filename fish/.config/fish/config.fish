set -gx EDITOR nvim
set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"

set -gx NNN_TRASH 1
set -gx NNN_OPTS "HdaA"
set -gx NNN_PLUG 'a:!afplay "$nnn" & *;m:mocq'

alias lg=lazygit
alias tg=toggl

fish_vi_key_bindings

zoxide init fish | source
starship init fish | source
pyenv init - | source
