#!/bin/bash

DOTFILES=$HOME/repos/dotfiles
# function ensurecommand { command -v $1 >/dev/null 2>&1 || { echo "$1 missing. Make sure it is available before running." >&2; exit 1; }; }
function promptstring { osascript -e "Tell application \"System Events\" to display dialog \"$1\" default answer \"\"" -e 'text returned of result' 2>/dev/null; }

# Create key
if [ ! -f $HOME/.ssh/id_rsa ]; then
  ssh-keygen -t rsa # Generate keys
fi

# Set hostname
name=`promptstring 'Enter friendly (full) computer name'`
sudo scutil –-set ComputerName $name
name=`promptstring 'Enter shortform computer name'`
sudo scutil –-set HostName $name
sudo scutil –-set LocalHostName $name
name=`promptstring 'Enter your mail address'`
git config --global user.name "Håvard Pedersen"
git config --global user.email $name

# Set up some local folders
mkdir ~/bin
mkdir ~/repos
git config --global core.excludesfile ~/.gitignore_global

# Symlink stuff
ln -s $DOTFILES/link/.bash_profile $HOME
ln -s $DOTFILES/link/.ctags $HOME
ln -s $DOTFILES/link/.gitignore_global $HOME
ln -s $DOTFILES/link/.tmux.conf $HOME
ln -s $DOTFILES/link/.tmuxinator $HOME
rm $HOME/.ssh/config ; ln -s $DOTFILES/link_special/ssh_config $HOME/.ssh/config

# Run scripts
source scripts/settings.sh
source scripts/packages.sh

# Package configuration
phpcs --config-set installed_paths ~/.composer/vendor/drupal/coder/coder_sniffer

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
