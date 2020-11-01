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
brew install graphviz
brew install gnu-sed
brew install aspell
brew install ispell
brew install ripgrep
brew install tmux
brew install shell-check  # For linting shell files in doom emacs.
brew install graphviz  # For exporting mindmap in org-roam via dot.
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
brew install emacs-plus@27 --with-no-frame-refocus

# Setup doomemacs
git clone --depth 1 https://github.com/hlissner/doom-emacs ~/Projects/doom-emacs
git clone git@github.com:satyamshekhar/doom-emacs-config.git ~/Projects/
ln -s ~/Projects/doom-emacs ~/.emacs.d
~/.emacs./bin/doom install
rm -r ~/.doom.d
ln -s ~/Projects/doom-emacs-config/ ~/.doom.d

# Sensible MacOs defaults (https://github.com/mathiasbynens/dotfiles)
osascript -e 'tell application "System Preferences" to quit'
# Increase sound quality for Bluetooth headphones/headsets
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" \
         -int 40
# Enable full keyboard access for all controls (enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3
# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 10
