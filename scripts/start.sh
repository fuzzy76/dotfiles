#!/bin/bash
# Check for git command
command -v git >/dev/null 2>&1 || { echo "git missing. Make sure it is available before running." >&2; exit 1; };
# If we dont have the dotfiles repo, get it
if [ ! -d "$HOME/repos/dotfiles" ]; then
  mkdir -p $HOME/repos
  git clone git@github.com:fuzzy76/dotfiles.git $HOME/repos/dotfiles
fi
# Change to dotfiles folder and start installation
cd $HOME/repos/dotfiles || exit;
source scripts/install.sh
