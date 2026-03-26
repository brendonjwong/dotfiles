#!/usr/bin/env bash
#
# Install settings for neovim

# Symlink nvim config
ln -s $(git rev-parse --show-toplevel)/.config/nvim ~/.config/

# Install vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install vim-plug packages
nvim +'PlugInstall' --headless +qa
