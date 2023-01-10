source "$HOME/.dotfiles/zsh/.zshrc.common"

export MANPAGER="sh -c 'col -bx | bat -l man -p'"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

alias snowsql=/Applications/SnowSQL.app/Contents/MacOS/snowsql

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
