set -gx EDITOR nvim
set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"

set -gx NNN_TRASH 1
set -gx NNN_OPTS HdaA
set -gx NNN_PLUG 'm:mocq'

# for some reason macos curl stopped working
set -gx HOMEBREW_FORCE_BREWED_CURL 1

alias lg=lazygit

# todo: figure out how to echo the command output
# alias togs="toggl stop"
# alias togb="toggl start betting -o betting"
# alias togw="toggl start exercise -o exercise"
# alias togj="toggl start job-hunt -o job-hunt"
# alias togm="toggl start music -o music"
# alias togp="toggl start project -o project"
# alias togr="toggl start reading -o reading"
# alias togc="toggl start scheduling -o scheduling"
# alias togs="toggl start sleeping -o sleeping"
# alias togw="toggl start work -o work"
# alias togf="toggl start workflow -o workflow"

fish_vi_key_bindings

zoxide init fish | source
starship init fish | source
pyenv init - | source
