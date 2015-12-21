#!/bin/bash

# Prerequisite : xcode command line tools?

#TODO Figure out which apps needs to be added to autostart
#TODO Figure out a better way to configure cloud syncing

# Stuff to consider: phpenv

# Functions

function ensurecommand { command -v $1 >/dev/null 2>&1 || { echo "$1 missing. Make sure it is available before running." >&2; exit 1; }; }
function promptstring { osascript -e "Tell application \"System Events\" to display dialog \"$1\" default answer \"\"" -e 'text returned of result' 2>/dev/null; }

# Requirements check
ensurecommand git

# Generic stuff
ssh-keygen -t rsa # Generate keys
# Make top-left hotspot start screensaver
defaults write com.apple.dock wvous-tl-corner -int 5 && \
defaults write com.apple.dock wvous-tl-modifier -int 0
# Set default Finder location to home folder (~/)
defaults write com.apple.finder NewWindowTarget -string "PfLo" && \
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}"
# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
# Don't write .DS_Store to network shares
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool TRUE

# Set hostname
name=`promptstring 'Enter friendly computer name'`
sudo scutil –-set ComputerName $name
name=`promptstring 'Enter shortform computer name'`
sudo scutil –-set HostName $name
sudo scutil –-set LocalHostName $name

# Install homebrew and packages
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
export PATH="/usr/local/sbin:/usr/local/bin:$PATH"
if [ ! brew doctor]
  echo "If the above does not look correct, fix it before continuing."
  read -p "Press [Enter] key to continue..."
fi
packages=(
ffmpeg
hr htop-osx
mariadb mtr
ruby
ssh-copy-id terminal-notifier wget youtube-dl
)
for item in ${packages[*]}
do
  brew install $item
done
# Custom homebrew installs
sudo easy_install pip ; sudo pip install docutils ; brew tap mpv-player/mpv ; brew install mpv --with-libaacs --with-bundle
brew install michaeldfallen/formula/git-radar

# Install homebrew cask and packages
brew tap caskroom/cask
packages =(
apptivate apptrap atom
crashplan
delivery-status dropbox
flash-player fluid
goog-edrive
handbrake hex-fiend
java
libreoffice
makemkv
omnidisksweeper omnifocus omnifocus-clip-o-tron
phpstorm
semulov sequel-pro skype sourcetree speedcrunch steam synology-cloud-station
teamviewer the-unarchiver
vlc
wordservice
xquartz
)
for item in ${packages[*]}
do
  brew cask install $item
done

# Install gems
gem install pro

# Install global composer and packages
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
packages =("d11wtq/boris" "drush/drush" )
for item in ${packages[*]}
do
  composer global require $item
done

# Set up some local folders
mkdir ~/bin
mkdir ~/repos

# Symlink some repo binaries in
git clone git@github.com:fuzzy76/medials.git ~/repos/medials
chmod +x ~/repos/medials/medials
ln -s ~/repos/medials/medials ~/bin/
git clone git@github.com:fuzzy76/bashquote.git ~/repos/bashquote
chmod +x ~/repos/bashquote/bashquote
ln -s ~/repos/bashquote/bashquote ~/bin/

# Cleanup
dscacheutil -flushcache
brew linkapps
