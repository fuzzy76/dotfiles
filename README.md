# Fuzzy76's dotfiles repo

<pre>This is my dotfiles repo.
There are many like it, but this one is mine.
My dotfiles repo is my best friend.
It is my life.
I must master it as I must master my life.
My dotfiles repo, without me, is useless.
Without my dotfiles repo, I am useless.</pre>

# Dotwhat?
A dotfiles repository is a repository for my personal configuration and computer setup. Fork it if you want. Have some links:
* [Dotfiles tutorial for OS X](http://code.tutsplus.com/tutorials/setting-up-a-mac-dev-machine-from-zero-to-hero-with-dotfiles--net-35449)
* [Dotfiles resource](https://dotfiles.github.io)
* [Generic dotfiles tutorial](https://medium.com/@webprolific/getting-started-with-dotfiles-43c3602fd789)
* [Supposedly the best of the crop](https://github.com/mathiasbynens/dotfiles)

# Install new Mac
1. Boot up the Mac, adding an iCloud account. Add iCloud sync of Desktop and Documents.
2. Open App store, install all updates.
3. If you want to use an existing key, install it before proceeding (chmod 700).
4. Install XCode, run ```sudo xcodebuild -license``` and ```xcode-select --install```
5. Install Rosetta2, run ```sudo softwareupdate --install-rosetta```
5. Open terminal and paste ```curl -s https://raw.githubusercontent.com/fuzzy76/dotfiles/master/scripts/start.sh | bash```
6. Do the App store manual installs below
7. Move the SSB's to their correct destination
8. Reboot (a lot of settings won't take effect until Finder etc has been restarted)

# Components
* scripts/start.sh - a bootstrap script for doing a one-line install (see point 5 above). Checks requirements, does a git clone and starts install.sh.
* scripts/install.sh - main script for handling installation.
* scripts/packages.sh - install packagehandlers (homebrew, homebrew cask, gem, npm, composer) and packages.
* scripts/settings.sh - tweak settings to my liking.
* bin/* - bash scripts added to the path of the system.
* git-hooks/* - git hooks. Not finished.
* link/* - config files symlinked to ~/
* link_special/* - config files symlinked elsewhere.

# Todo
These will probably be moved to issues once I feel the repo is stable:
* Figure out which apps needs to be added to autostart
* Consider phpenv end rbenv
* Convert some of my personal repositories (bashquote, medials, etc) into composer packages
* Themes for atom, phpstorm and terminal
* [Xcode license check](https://github.com/CalQL8ed-K-OS/CocoaPods/commit/242d3a3d774f5f3370ae0c5ef783bda993d7029f)
* Some packages are only for some of my computers.
* Github tokens for composer and homebrew.
* Visual studio code extensions and settings sync
* Automate crontab install
* Install App Store apps with [MAS](https://github.com/mas-cli/mas)
* Add Plain Text Editor
* Fix symfony-cli to use core repo
* Figure out httpie link confusion issues
* Catppucin terminal

# App store manual install
* 1Blocker
* Bookmarker for pinboard
* Consent-O-Matic
* Deliveries
* Divvy
* Feedbin
* iNet Network Scanner
* Mindnode
* Neptunes
* Pixelmator Classic
* Quickgif
* [Save to Pocket](https://apps.apple.com/no/app/save-to-pocket/id1477385213?l=nb&mt=12)
* Shareful
* Things

# Other stuff to install manually
* Company software (Office including teams)

# Settings I couldn't automate
* Mission control on mousebutton 4
* Change Safari search engine to Duck Duck Go
* Change menubar clock from weekday to date
* Change Finder sidepanel to point to all PARA file roots
* Import Dracula color theme to terminal.app, set black background and 90% opacity.
* Enable Safari extensions

# Personal pre-reinstall checklist
* Check all folders under ~
* Transfer ~/Downloads
* Save open tabs in Safari (rest should be synced)
* Make sure Photos.app is done syncing
* Transfer ssh key if desired
* Save any virtual machines
* iTunes library
* Check repositories for uncommited changes (`gitall status`)
* Check homebrew warnings for deprecated formulas

# Linkdump
* https://github.com/herrbischoff/awesome-osx-command-line
* https://github.com/mathiasbynens/dotfiles/blob/master/.osx
* https://github.com/hjuutilainen/dotfiles/blob/master/bin/osx-user-defaults.sh

# Crontab
```
# 0 0 * * * cp /Users/fuzzy76/Library/Safari/Bookmarks.plist /Users/fuzzy76/backup/Safari_Bookmarks_d_$(date +'%A').plist
# 0 0 * * 0 cp /Users/fuzzy76/Library/Safari/Bookmarks.plist /Users/fuzzy76/backup/Safari_Bookmarks_w_$(date +'%V').plist
0 7 * * * /usr/bin/killall exchangesyncd > /dev/null 2>&1
```

# Regular computer "sync"

- Remove unused packages
- Review installed homebrew casks for inclusion
- Review /Applications for inclusion
- Review menubar for inclusion
- Review login items for inclusion
- Review all repos and push changes
- Review App Store items for cask candidates
