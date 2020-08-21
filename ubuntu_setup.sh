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

# Install Emacs
pushd ~/Projects
git clone --single-branch --branch emacs-27 --depth 1 \
    https://github.com/emacs-mirror/emacs.git
cd emacs/
sudo apt install -y autoconf make gcc texinfo libgtk-3-dev libxpm-dev \
     libjpeg-dev libgif-dev libtiff5-dev libgnutls28-dev libncurses5-dev \
     libjansson-dev libharfbuzz-dev libharfbuzz-bin
./autogen.sh
./configure --with-json --with-modules --with-harfbuzz \
    --with-compress-install --with-threads --with-included-regex \
    --with-zlib
make -j12
sudo make install

# Setup dud
cd ../
git clone git@github.com:satyamshekhar/dud.git
mkdir -p ~/.emacs.d/
cp $HOME/Projects/dotfiles/emacs.init.el ~/.emacs.d/init.el
ln -s $HOME/Projects/dud $HOME/.emacs.d/dud
