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
hr htop-osx httpie
imagemagick
mtr
nginx nmap node
ocrmypdf
php
shellcheck ssh-copy-id
terminal-notifier the_silver_searcher
wget
youtube-dl
)
for item in ${packages[*]}
do
  brew install $item
done

# Python
#pip3 install pip-tools virtualenv
#pip install pip-tools virtualenv

# Homebrew cask
brew tap homebrew/cask-drivers
packages=(
apptivate adobe-digital-editions asix-ax88179 advancedrestclient
basecamp calibre
cold-turkey-blocker coteditor cyberduck
dash docker dozer discord dupeguru
ferdi firefox
garmin-express gas-mask google-chrome
handbrake hex-fiend hey
iina itsycal
java
kobo
latest libreoffice logitech-g-hub logitech-options
makemkv messenger
omnidisksweeper
qlstephen quicklook-json
sbarex-qlmarkdown sequel-ace shapes signal speedcrunch steam
tableplus telegram tenor the-unarchiver typora
unlox
virtualbox virtualbox-extension-pack visual-studio-code vlc
wordservice
zoom
)
for item in ${packages[*]}
do
  brew install --cask $item
done

# Gems
# sudo gem install pro

# Node
npm install -g nativefier

# Composer
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
packages=("psy/psysh" "squizlabs/php_codesniffer=*")
for item in ${packages[*]}
do
  composer global require $item
done
