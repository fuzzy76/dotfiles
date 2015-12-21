#!/bin/bash

## Make top-left hotspot start screensaver
defaults write com.apple.dock wvous-tl-corner -int 5 && \
defaults write com.apple.dock wvous-tl-modifier -int 0

# Set default Finder location to home folder (~/)
defaults write com.apple.finder NewWindowTarget -string "PfLo" && \
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}"

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

# Don't write .DS_Store to network shares
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool TRUE
