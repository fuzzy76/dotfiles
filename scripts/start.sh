#!/bin/bash

# This file check outs the repository and starts the rest of the installation from inside.

# Check for git command
command -v git >/dev/null 2>&1 || { echo "git missing. Make sure it is available before running." >&2; exit 1; };

# Check for key, generate if missing
if [ ! -d "$HOME/.ssh" ]; then
  ssh-keygen -t rsa -b 4096
fi

# If we dont have the dotfiles repo, get it
if [ ! -d "$HOME/repos/dotfiles" ]; then
  mkdir -p $HOME/repos
  git clone git@github.com:fuzzy76/dotfiles.git $HOME/repos/dotfiles
fi

# Change to dotfiles folder and start installation
cd $HOME/repos/dotfiles || exit;
source scripts/install.sh
