source "$HOME/.dotfiles/zsh/.zshrc.common"

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias fc='cd $(fd --type directory | fzf)'

export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source ${HOME}/.ghcup/env
