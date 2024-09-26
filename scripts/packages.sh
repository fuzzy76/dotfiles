#!/bin/bash

# Since we might run on the system default .bash_profile, we need to fix the paths here
export PATH="$HOME/repos/dotfiles/bin:$HOME/bin:$HOME/.composer/vendor/bin:/usr/local/bin:/usr/local/sbin:$PATH"
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> $HOME/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
if ! brew doctor ; then
  echo "If the above does not look correct, fix it before continuing."
  read -p "Press [Enter] key to continue..."
fi
packages=(
composer
ffmpeg
hr htop-osx
imagemagick
mtr
nginx nmap
ocrmypdf
php pyenv
shellcheck
the_silver_searcher
wget
yt-dlp
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
brew tap homebrew/cask-fonts
brew tap dracula/install
brew tap sokoloffa/radiola
packages=(
apptivate adobe-digital-editions
boop
calibre cheatsheet coteditor cyberduck
dash dracula-terminal docker dozer discord dupeguru
firefox focus font-sf-mono font-sf-pro
garmin-express gas-mask gitify google-chrome
handbrake hex-fiend httpie
iina itsycal
java
kobo
latest libreoffice logitech-g-hub logi-options-plus
makemkv messenger
omnidisksweeper
qlstephen quicklook-json
radiola
sbarex-qlmarkdown sequel-ace shapes signal speedcrunch steam
tableplus the-unarchiver thingsmacsandboxhelper
unetbootin unlox utm
visual-studio-code vlc
wordservice
zoom
)
for item in ${packages[*]}
do
  brew install --cask --no-quarantine $item
done

# Composer
packages=("psy/psysh" "squizlabs/php_codesniffer=*")
for item in ${packages[*]}
do
  composer global require $item
done
