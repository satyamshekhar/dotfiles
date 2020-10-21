#!/bin/bash

set +e
set -x

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install bash
brew install git
brew install coreutils
brew install fzf
brew install ispell
/usr/local/opt/fzf/install
brew install coreutils
brew install clang-format
brew install fd
brew install gnu-sed
# Install shellcheck and marked for Doom emacs.
brew install shell-check
sudo npm install -g marked

sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'
chsh -s /usr/local/bin/bash
sudo /sbin/reboot

brew install tmux

# vim-polyglot by cloning module

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
~/.emacs./bin/doom install
rm -r ~/.doom.d
ln -s ~/Projects/doom-emacs-config/ ~/.doom.d
