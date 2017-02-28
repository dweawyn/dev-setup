#!/usr/bin/env bash

# Install command-line tools using Homebrew.

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

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
brew install bash
brew tap homebrew/versions
brew install bash-completion2
# We installed the new shell, now we have to activate it
echo "Adding the newly installed shell to the list of allowed shells"
# Prompts for password
sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'
# Change to the new shell, prompts for password
chsh -s /usr/local/bin/bash

# Install `wget` with IRI support.
brew install wget --with-iri

# Install RingoJS and Narwhal.
# Note that the order in which these are installed is important;
# see http://git.io/brew-narwhal-ringo.
#brew install ringojs
#brew install narwhal

# Install Python
brew install python
brew install python3

# Install ruby-build and rbenv
# brew install ruby-build
# brew install rbenv
# LINE='eval "$(rbenv init -)"'
# grep -q "$LINE" ~/.extra || echo "$LINE" >> ~/.extra

# Install more recent versions of some OS X tools.
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen
# brew install homebrew/php/php55 --with-gmp

# Install font tools.
# brew tap bramstein/webfonttools
# brew install sfnt2woff
# brew install sfnt2woff-zopfli
# brew install woff2

# Install some CTF tools; see https://github.com/ctfs/write-ups.
# brew install aircrack-ng
# brew install bfg
# brew install binutils
# brew install binwalk
# brew install cifer
# brew install dex2jar
# brew install dns2tcp
# brew install fcrackzip
# brew install foremost
# brew install hashpump
# brew install hydra
# brew install john
# brew install knock
# brew install netpbm
# brew install nmap
# brew install pngcheck
# brew install socat
# brew install sqlmap
# brew install tcpflow
# brew install tcpreplay
# brew install tcptrace
# brew install ucspi-tcp # `tcpserver` etc.
# brew install homebrew/x11/xpdf
# brew install xz

# Install other useful binaries.
# Tool like grep, optimized for programmers Designed for programmers with large heterogeneous trees of source code.
brew install ack
# brew install dark-mode
#brew install exiv2
brew install git
brew install git-lfs
brew install git-flow
brew install git-extras
brew install hub
# brew install imagemagick --with-webp
# brew install lua
# brew install lynx
brew install p7zip
brew install pigz
brew install pv
# Command line tool to rename files according to modification rules specified.
brew install rename
# Open-source implementation of JavaScript written entirely in Java.
# brew install rhino
# Command line interface for testing internet bandwidth using speedtest.net
brew install speedtest_cli
# install your public key in a remote machine's authorized_keys.
brew install ssh-copy-id
#ree is a recursive directory listing command that produces a depth indented listing of files.
brew install tree
# Command line tool that creates screenshots of webpages.
brew install webkit2png
# Compression Algorithm is a compression library programmed in C to perform very good, but slow, deflate or zlib compression.
# brew install zopfli
# Helper tool used when compiling applications and libraries.
# brew install pkg-config
# A Portable Foreign Function Interface Library.
# brew install libffi
# A universal document converter.
brew install pandoc

# Lxml and Libxslt
brew install libxml2
brew install libxslt
brew link libxml2 --force
brew link libxslt --force

# Install Heroku
brew install heroku-toolbelt
heroku update

# Install Cask
brew install caskroom/cask/brew-cask
brew tap caskroom/versions

# Core casks
brew cask install --appdir="/Applications" alfred
brew cask install --appdir="~/Applications" iterm2
brew cask install --appdir="~/Applications" java
brew cask install --appdir="~/Applications" xquartz
brew cask install --appdir="/Applications" google-chrome
brew cask install --appdir="/Applications" dropbox

# Development tool casks
#brew cask install --appdir="/Applications" sublime-text
brew cask install --appdir="/Applications" dash
brew cask install --appdir="/Applications" cyberduck
brew cask install go2shell

# Multimedia
brew cask install --appdir="/Applications" vlc
brew cask install --appdir="/Applications" mpv
brew cask install --appdir="/Applications" vox
brew cask install --appdir="/Applications" spotify
brew cask install spotifree
brew cask install --appdir="/Applications" spotify-notifications

# Misc casks
brew cask install --appdir="/Applications" skype
brew cask install --appdir="/Applications" slack
brew cask install --appdir="/Applications" evernote
brew cask install --appdir="/Applications" the-unarchiver
brew cask install --appdir="/Applications" disk-inventory-x
brew cask install --appdir="/Applications" appcleaner
brew cask install --appdir="/Applications" flux
brew cask install --appdir="/Applications" cheatsheet
brew cask install --appdir="/Applications" namechanger
brew cask install --appdir="/Applications" spectacle
brew cask install --appdir="/Applications" wunderlist
brew cask install --appdir="/Applications" jdownloader
brew cask install --appdir="/Applications" qbittorrent

#Remove comment to install LaTeX distribution MacTeX
#brew cask install --appdir="/Applications" mactex

# Install Docker, which requires virtualbox
# brew install docker
# brew install boot2docker

# Install developer friendly quick look plugins; see https://github.com/sindresorhus/quick-look-plugins
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql qlimagesize webpquicklook suspicious-package

# Remove outdated versions from the cellar.
brew cleanup
