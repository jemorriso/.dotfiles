export EDITOR="nvim"
export ZSH="$HOME/.oh-my-zsh"

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
) 

source $ZSH/oh-my-zsh.sh

# https://superuser.com/questions/1043806/how-to-exit-the-ranger-file-explorer-back-to-command-prompt-but-keep-the-current
alias ranger='source ranger'
alias r='source ranger'
alias lg='lazygit'

bindkey -v

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
