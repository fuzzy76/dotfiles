#Fuzzy76's dotfiles repo

<pre>This is my dotfiles repo.
There are many like it, but this one is mine.
My dotfiles repo is my best friend.
It is my life.
I must master it as I must master my life.
My dotfiles repo, without me, is useless.
Without my dotfiles repo, I am useless.</pre>

#Dotwhat?
A dotfiles repository is a repository for my personal configuration and computer setup. Fork it if you want. Have some links:
* [Dotfiles tutorial for OS X](http://code.tutsplus.com/tutorials/setting-up-a-mac-dev-machine-from-zero-to-hero-with-dotfiles--net-35449)
* [Dotfiles resource](https://dotfiles.github.io)
* [Generic dotfiles tutorial](https://medium.com/@webprolific/getting-started-with-dotfiles-43c3602fd789)
* [Supposedly the best of the crop](https://github.com/mathiasbynens/dotfiles)

#Install new Mac
1. Boot up the Mac, adding an iCloud account.
2. Open App store, install all updates.
3. Install XCode, and run ```sudo xcodebuild -license```
4. If you want to use an existing key, install it before proceeding (chmod 700).
5. Open terminal and paste ```curl -s https://raw.githubusercontent.com/fuzzy76/dotfiles/master/scripts/start.sh | bash```
6. Do the App store manual installs below
7. Reboot (a lot of settings won't take effect until Finder etc has been restarted)

#Components
* scripts/start.sh - a bootstrap script for doing a one-line install (see point 5 above). Checks requirements, does a git clone and starts install.sh.
* scripts/install.sh - main script for handling installation.
* scripts/packages.sh - install packagehandlers (homebrew, homebrew cask, gem, npm, composer) and packages.
* scripts/settings.sh - tweak settings to my liking.
* bin/* - bash scripts added to the path of the system.
* conf/* - config files used during installation, but not linked anywhere.
* git-hooks/* - git hooks. Not finished.
* link/* - config files symlinked to ~/
* link_special/* - config files symlinked elsewhere.

#Todo
These will probably be moved to issues once I feel the repo is stable:
* Figure out which apps needs to be added to autostart
* Figure out a better way to configure cloud syncing
* Consider phpenv end rbenv
* Automate symlinking
* Convert some of my personal repositories (bashquote, medials, etc) into composer packages
* Themes for atom, phpstorm and terminal
* Plugins for phpstorm
* [Xcode license check](https://github.com/CalQL8ed-K-OS/CocoaPods/commit/242d3a3d774f5f3370ae0c5ef783bda993d7029f)
* Some packages (crashplan, teamviewer, focus etc) are only for some of my computers.
* Github tokens for composer and homebrew.

#App store manual install
* Divvy
* HardwareGrowler
* Pixelmator
* iNet Network Scanner
* Thumbtack
* Microsoft Remote Desktop
* Deliveries
* Timing
* Mindnode Pro 1
* Mindful Mynah

#Other stuff to install manually
* [Zenburn for terminal.app](https://github.com/bdesham/zenburn-terminal)
* Company software (Office)
* Company VPN (add Cisco IPSec config)
* Browser extensions (see list below)

#Settings I couldn't automate
* Mission control on mousebutton 4
* Change Safari search engine to Duck Duck Go
* Change menubar clock from weekday to date
* Add ```git@github.com:fuzzy76/intellij-settings.git``` as a PhpStorm settings repository

#Personal pre-reinstall checklist
* Check all folders under ~
* Transfer ~/Downloads
* Save open tabs in Safari (rest should be synced)
* Make sure Photos.app is done syncing
* Transfer ssh key if desired
* Clean up Desktop
* Save any virtual machines
* iTunes library
* ~/Library/Preferences/com.sequelpro.SequelPro.plist and ~/Library/Application\ Support/Sequel\ Pro
* crontab
* Check repositories for uncommited changes

#Safari extensions
* [ClickToPlugin](http://hoyois.github.io/safariextensions/clicktoplugin/)
* [EXIF Viewer](https://code.google.com/p/exif-vewer-extension/)
* Google Docs Viewer - DEAD
* [Google Image Search](https://github.com/estum/Google-Image-Search-safariextension/downloads)
* [NoMoreiTunes](http://nomoreitunes.einserver.de)
* [Dreditor](https://dreditor.org)
* [Minimal Status Bar](https://visnup.github.io/Minimal-Status-Bar/)
* [Disconnect](https://disconnect.me/disconnect)
* [Synology Download Station](https://www.download-station-extension.com)
