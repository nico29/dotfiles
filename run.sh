#!/usr/bin/env bash

if [[ -z "$SKIP_SETUP" ]]; then
    # 1. install oh-my-zsh
    if [ ! -d .oh-my-zsh ]; then
      sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
      echo "✔ done installing oh-my-zsh"
    fi

    # 2. install homebrew
    if ! [ -x "$(command -v brew)" ]; then
      echo 'Installing homebrew...' >&1
      /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
      echo "✔ done installing homebrew"
      else
        echo "✔ homebrew already installed"
    fi

    # 3. taping cellars
    echo 'Installing taps...'
    brew tap homebrew/cask-fonts
    brew tap homebrew/cask-versions
    echo '✔ done installing taps'

    # 4. install CLI and GUI
    echo "Installing CLI tools..."
    brew install exa git neovim node python tree wget yarn zsh bash zsh-syntax-highlighting
    echo '✔ done installing CLI tools'
    echo "Installing GUI tools..."
    brew cask install alfred docker iterm2 setapp spotify visual-studio-code google-chrome-dev font-firacode-nerd-font-mono slack-beta
    echo '✔ done installing GUI tools'
  else
   echo "jumping to linking!"
fi

#4. link files
echo "Linking files..."
ln -sfn ./bin $HOME/bin
ln -sfn config/aliases $HOME/.aliases
ln -sfn config/zshrc $HOME/.zshrc
ln -sfn config/gitconfig $HOME/.gitconfig
mkdir -p $HOME/.config/nvim
ln -sfn config/init.vim $HOME/.config/nvim/init.vim
echo '✔ done linking files'




