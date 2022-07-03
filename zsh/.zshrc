# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=100000
setopt autocd extendedglob
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/jerry/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# https://superuser.com/questions/1043806/how-to-exit-the-ranger-file-explorer-back-to-command-prompt-but-keep-the-current
alias ranger='source ranger'
alias r='source ranger'

export ZSH="$HOME/.oh-my-zsh"

export PATH="$PATH:/home/jerry/.local/bin"

plugins=(
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
  vi-mode
)

source $ZSH/oh-my-zsh.sh

eval "$(zoxide init zsh)"

eval "$(starship init zsh)"

source $ZSH/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
