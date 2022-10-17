alias lg='lazygit'

export EDITOR="nvim"

export ZSH="$HOME/.oh-my-zsh"

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
) 

source $ZSH/oh-my-zsh.sh

bindkey -v

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
