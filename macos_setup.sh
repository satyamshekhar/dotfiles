#!/bin/bash

set +e
set -x

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install bash
brew install clang-format
brew install coreutils
brew install fd
brew install fzf
/usr/local/opt/fzf/install
brew install git
brew install gnu-sed
brew install ispell
brew install ripgrep
brew install tmux
brew install shell-check  # For linting shell files in doom emacs.
sudo npm install -g marked  # For markdown preview in doom-emacs.

# Setup bash.
sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'
chsh -s /usr/local/bin/bash
sudo /sbin/reboot
echo "source ~/.bashrc" >> ~/.bash_profile
echo "source ~/Projects/dotfiles/bashrc" >> ~/.bashrc
ln -s $HOME/Projects/dotfiles/tmux.conf ~/.tmux.conf
ln -s $HOME/Projects/dotfiles/vimrc ~/.vimrc

# Install Emacs.
# TODO: Add steps for MacOs.

# Setup doomemacs
git clone --depth 1 https://github.com/hlissner/doom-emacs ~/Projects/doom-emacs
git clone git@github.com:satyamshekhar/doom-emacs-config.git ~/Projects/
ln -s ~/Projects/doom-emacs ~/.emacs.d
~/.emacs./bin/doom install
rm -r ~/.doom.d
ln -s ~/Projects/doom-emacs-config/ ~/.doom.d
