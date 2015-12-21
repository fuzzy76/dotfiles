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
source scripts/settings.sh

# Set hostname
name=`promptstring 'Enter friendly computer name'`
sudo scutil –-set ComputerName $name
name=`promptstring 'Enter shortform computer name'`
sudo scutil –-set HostName $name
sudo scutil –-set LocalHostName $name

# Set up some local folders
mkdir ~/bin
mkdir ~/repos

source scripts/packages.sh

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
