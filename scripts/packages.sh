#!/bin/bash

# Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
export PATH="/usr/local/sbin:/usr/local/bin:$PATH"
if ! brew doctor ; then
  echo "If the above does not look correct, fix it before continuing."
  read -p "Press [Enter] key to continue..."
fi
packages=(
ffmpeg
hr htop-osx
mariadb mtr
ruby
ssh-copy-id
terminal-notifier
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
packages=(
apptivate apptrap atom
crashplan
delivery-status dropbox
evernote
flash-player fluid firefox focus
google-drive google-chrome gifs
handbrake hex-fiend
java
libreoffice
makemkv macid
omnidisksweeper omnifocus omnifocus-clip-o-tron
phpstorm
semulov sequel-pro skype sourcetree speedcrunch steam synology-cloud-station skitch
teamviewer the-unarchiver
vlc
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
packages=("d11wtq/boris" "drush/drush" )
for item in ${packages[*]}
do
  composer global require $item
done

# Atom plugins
# (apm is probably not available directly until the command line tool has been installed from within Atom)
/Applications/Atom.app/Contents/Resources/app/apm/node_modules/.bin/apm install atom-autocomplete-php
/Applications/Atom.app/Contents/Resources/app/apm/node_modules/.bin/apm install php-twig
/Applications/Atom.app/Contents/Resources/app/apm/node_modules/.bin/apm install imdone-atom
/Applications/Atom.app/Contents/Resources/app/apm/node_modules/.bin/apm install symbols-tree-view
/Applications/Atom.app/Contents/Resources/app/apm/node_modules/.bin/apm install linter
/Applications/Atom.app/Contents/Resources/app/apm/node_modules/.bin/apm install linter-php
/Applications/Atom.app/Contents/Resources/app/apm/node_modules/.bin/apm install linter-shellcheck
