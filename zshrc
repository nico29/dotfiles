export ZSH=/Users/nicolas/.oh-my-zsh
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH="$HOME/bin:$PATH";
ZSH_THEME="materialshell"

plugins=(
  git
  node
  npm
  brew
  fast-syntax-highlighting
  yarn
  docker-compose
)

source $ZSH/oh-my-zsh.sh

source ~/.aliases
