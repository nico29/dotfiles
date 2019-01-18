POWERLEVEL9K_MODE='awesome-fontconfig'
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
export POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
source /usr/local/opt/powerlevel9k/powerlevel9k.zsh-theme
DISABLE_AUTO_UPDATE="true"
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# BASE16_SHELL=$HOME/.config/base16-shell/
# [ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export PATH="$HOME/bin:$PATH";
export PATH="$HOME/Workspace/server:$PATH";
# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
plugins=(git brew node docker npm yarn zsh-better-npm-completion docker-compose)

source $ZSH/oh-my-zsh.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
source $HOME/.aliases
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export FZF_DEFAULT_COMMAND='fd --type f'
export PATH=/Users/nicolasmarien/.deno/bin:$PATH
