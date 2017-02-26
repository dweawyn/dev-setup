#!/usr/bin/env bash

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Create authorised keys
mkdir ~/.ssh
chmod 700 ~/.ssh
touch ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys
ssh-keygen -t rsa -b 2048 -f ~/.ssh/id_rsa -C "Enter an optional comment about your key"

cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

# Install Docker using dlite
brew install docker
brew install dlite
sudo dlite install

# Remove outdated versions from the cellar.
brew cleanup