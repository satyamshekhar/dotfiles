#!/bin/bash

# set +e
# set -x

sudo apt-get install git coreutils ispell clang-format tmux apt-file \
  build-essential libgnutls28-dev texinfo

# sudo apt-get install fzf
# sudo snap install ripgrep
# vim-polyglot by cloning module

echo "source ~/Projects/dotfiles/bashrc" >> ~/.bashrc
ln -s $HOME/Projects/dotfiles/tmux.conf ~/.tmux.conf
ln -s $HOME/Projects/dotfiles/vimrc ~/.vimrc
