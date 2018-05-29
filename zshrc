export ZSH=/Users/nicolas/.oh-my-zsh
export PATH="$HOME/bin:$PATH";
ZSH_THEME="materialshell"

plugins=(
  git
  node
  npm
  brew
  fast-syntax-highlighting
  yarn
)

source $ZSH/oh-my-zsh.sh

source ~/.aliases
