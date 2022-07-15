# https://superuser.com/questions/1043806/how-to-exit-the-ranger-file-explorer-back-to-command-prompt-but-keep-the-current
alias ranger='source ranger'
alias r='source ranger'

export ZSH="$HOME/.oh-my-zsh"

export PATH="$PATH:/home/jerry/.local/bin"

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
) 
#plugins+=(history-substring-search)

source $ZSH/oh-my-zsh.sh

bindkey -v

#export NNN_PLUG='p:preview-tui;c:fzcd;o:fzopen;a:bookmarks;k:pskill;d:dragdrop;h:fzhist;z:fzz;y:cbcp'
export NNN_TRASH=1
# Show hidden files by default
export NNN_OPTS="H"

eval "$(zoxide init zsh)"

# enable syntax highlighting
#source /home/jerry/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval "$(starship init zsh)"
