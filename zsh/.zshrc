# https://superuser.com/questions/1043806/how-to-exit-the-ranger-file-explorer-back-to-command-prompt-but-keep-the-current
alias ranger='source ranger'
alias r='source ranger'
alias n='nnn -H'
alias lg='lazygit'

export EDITOR="nvim"

export ZSH="$HOME/.oh-my-zsh"
export PATH="$PATH:/home/jerry/.local/bin"
export NNN_TRASH=1
export NNN_OPTS="H"

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
) 
#plugins+=(history-substring-search)

source $ZSH/oh-my-zsh.sh

bindkey -v

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
