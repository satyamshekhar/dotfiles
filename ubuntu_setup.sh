#!/bin/bash

# set +e
# set -x

# Install apt packages.
sudo apt-get install git coreutils ispell clang-format tmux apt-file \
  build-essential libgnutls28-dev texinfo shellcheck
# Install ripgrep, a faster alternative for grep.
sudo snap install ripgrep --classic
# Install fd-find, a faster alternative for find.
wget "https://github.com/sharkdp/fd/releases/download/v8.1.1/fd_8.1.1_amd64.deb" -O /tmp/
sudo dpkg -i /tmp/fd_8.1.1_amd64.deb

# sudo apt-get install fzf
# vim-polyglot by cloning module

# Install marked MarkDown compiler for Doom emacs.
# sudo npm install -g marked

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
     libjansson-dev libharfbuzz-dev libharfbuzz-bin mailutils libxml2-dev \
     texlive
./autogen.sh
./configure --with-json --with-modules --with-harfbuzz \
    --with-mailutils --with-xml2 --with-compress-install --with-threads \
    --with-included-regex  --with-zlib
make -j12
sudo make install

# Setup dud
cd
git clone git@github.com:satyamshekhar/dud.git
mkdir -p ~/.emacs.d/
ln -s $HOME/Projects/dotfiles/emacs.init.el ~/.emacs.d/init.el
ln -s $HOME/Projects/dud $HOME/.emacs.d/dud

# Setup doomemacs
git clone --depth 1 https://github.com/hlissner/doom-emacs ~/Projects/doom-emacs
git clone git@github.com:satyamshekhar/doom-emacs-config.git ~/Projects/
ln -s ~/Projects/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install
rm -r ~/.doom.d
ln -s ~/Projects/doom-emacs-config/ ~/.doom.d
