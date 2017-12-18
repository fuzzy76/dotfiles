#!/bin/bash

# Since we might run on the system default .bash_profile, we need to fix the paths here
export PATH="$HOME/repos/dotfiles/bin:$HOME/bin:$HOME/.composer/vendor/bin:/usr/local/bin:/usr/local/sbin:$PATH"
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
export PATH="/usr/local/sbin:/usr/local/bin:$PATH"
if ! brew doctor ; then
  echo "If the above does not look correct, fix it before continuing."
  read -p "Press [Enter] key to continue..."
fi
packages=(
ffmpeg
heroku hr htop-osx
mtr mosh
nginx npm homebrew/dupes/nano
ruby
shellcheck ssh-copy-id
terminal-notifier the_silver_searcher tmux
wget
youtube-dl
)
for item in ${packages[*]}
do
  brew install $item
done
# Custom homebrew installs
sudo easy_install pip ; sudo pip install docutils ; brew tap mpv-player/mpv ; brew install mpv --with-libaacs --with-bundle
brew install michaeldfallen/formula/git-radar

# Python
pip3 install pip-tools virtualenv
pip install pip-tools virtualenv

# Homebrew cask
brew tap caskroom/cask
brew tap caskroom/fonts
brew tap caskroom/drivers
packages=(
apptivate apptrap aerial adobe-digital-editions asix-ax88179
dash docker dropbox
fluid firefox focus font-inconsolata
gas-mask google-backup-and-sync google-chrome gifs
handbrake hex-fiend
java
kobo
makemkv mumble microsoft-teams
omnidisksweeper omnifocus
semulov sequel-pro skype skype-for-business speedcrunch steam synology-cloud-station-backup synology-cloud-station-drive
the-unarchiver time-out typora
vlc vagrant virtualbox virtualbox-extension-pack visual-studio-code
wordservice
xquartz
)
for item in ${packages[*]}
do
  brew cask install $item
done

# Gems
gem install pro

# Composer
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
packages=("d11wtq/boris" "drush/drush" "squizlabs/php_codesniffer=*" "drupal/coder")
for item in ${packages[*]}
do
  composer global require $item
done
