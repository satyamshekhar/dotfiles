#!/bin/bash

# Steps before running this script -

# Update macOS
#
# # Install Chrome, Firefox from AppStore
# # Install Alfred from AppStore
# # Install Moom from AppStore
# # Install GoodNotes 5 from AppStore
# # Install iterm2
# # Install Karabiner Elements
# cp com.googlecode.iterm2.plist ~/Library/Preferences/
# cp Projects/dotfiles/karabiner.json .config/karabiner/karabiner.json
# brew install bash-completion@2

# Change network name
#
# sudo scutil --set HostName xyler
# sudo scutil --set LocalHostName xyler
# sudo scutil --set ComputerName xyler
# dscacheutil -flushcache
# # Restart computer

set +e
set -x

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

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
# Is this required?
# brew install sqlite sqlite3
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
ln -s $HOME/Projects/dotfiles/gitconfig ~/.gitconfig

# Setup VIM
git clone https://github.com/flazz/vim-colorschemes ~/Projects/vim-colorschemes
mkdir -p ~/.vim/colors
cp ~/Projects/vim-colorschemes/colors/* ~/.vim/colors

# Setup tmux
mkdir -p ~/.tmux/themes
ln -s ~/Projects/dotfiles/tomorrow.tmux ~/.tmux/themes/

# Install Emacs.
brew install emacs-plus@27 --with-no-frame-refocus --with-xwidgets \
  --with-mailutils --with-dbus

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
defaults write NSGlobalDomain KeyRepeat -int 4
defaults write NSGlobalDomain InitialKeyRepeat -int 20
