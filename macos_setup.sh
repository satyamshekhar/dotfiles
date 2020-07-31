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

sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'
chsh -s /usr/local/bin/bash
sudo /sbin/reboot

brew install tmux

# vim-polyglot by cloning module
