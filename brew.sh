
# Install command-line tools using Homebrew.
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

# Make sure we’re using the latest Homebrew.
brew update
# Upgrade any already-installed formulae.
brew upgrade --all

# Install Heroku
# brew 'heroku-toolbelt
# heroku update

# Install Brewfile
brew bundle check &>/dev/null || brew bundle

# PostInstalls
#GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum
# We installed the new Bash 4, now we have to activate it
echo "Adding the newly installed shell to the list of allowed shells"
sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'
chsh -s /usr/local/bin/bash
# Lxml and Libxslt
brew link libxml2 --force
brew link libxslt --force

# Remove outdated versions from the cellar.
brew cleanup
