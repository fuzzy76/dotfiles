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
docker
ffmpeg
hr htop-osx
mtr mosh
nginx npm homebrew/dupes/nano
ruby
shellcheck ssh-copy-id
terminal-notifier tmux
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

# Homebrew cask
brew tap caskroom/cask
brew tap caskroom/fonts
packages=(
apptivate apptrap aerial adobe-digital-editions
dropbox
flash fluid firefox focus
font-inconsolata
gas-mask google-drive google-chrome gifs
handbrake hex-fiend
java
kobo
libreoffice
makemkv macid
omnidisksweeper omnifocus omnifocus-clip-o-tron
phpstorm pycharm
semulov sequel-pro skype speedcrunch steam synology-cloud-station
teamviewer the-unarchiver time-out the_silver_searcher
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
gem install tmuxinator

# Composer
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
packages=("d11wtq/boris" "drush/drush" "squizlabs/php_codesniffer=*" "drupal/coder")
for item in ${packages[*]}
do
  composer global require $item
done

# Atom plugins
# (apm is probably not available directly until the command line tool has been installed from within Atom)
/Applications/Atom.app/Contents/Resources/app/apm/node_modules/.bin/apm install --packages-file conf/atom-packages.txt
