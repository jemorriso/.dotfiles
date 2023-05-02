source ~/.dotfiles/fish/config.common.fish

pyenv init - | source

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME
set -gx PATH $HOME/.cabal/bin /Users/jerry/.ghcup/bin $PATH # ghcup-env
