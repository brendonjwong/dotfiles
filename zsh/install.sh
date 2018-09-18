#!/usr/bin/env bash
#
# Install oh-my-zsh

if [ -d ~/.oh-my-zsh ]; then
  printf "Found ~/.oh-my-zsh. No need to install.\n"
  exit 0
fi

sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - |
  sed '/env zsh/d')"

if [ -f ~/.zshrc.pre-oh-my-zsh ] || [ -h ~/.zshrc.pre-oh-my-zsh ]; then
  printf "Found ~/.zshrc.pre-oh-my-zsh. Renaming to .zshrc\n"
  mv ~/.zshrc.pre-oh-my-zsh ~/.zshrc
fi

# Install Powerline fonts for ZSH themes
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts
