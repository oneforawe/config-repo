#!/usr/bin/env bash
# filename: run-setup-MacOS-env.sh
# purpose: Automate setting up some MacOS environment properties
#   for desktop and apps.


# Inspirations:
# https://github.com/mathiasbynens/dotfiles/blob/master/.macos
# https://gist.github.com/tylerwalts/9375263

# TODO: Capture all the little environment options that I like.


###############################################################################
# Prep and Admin Access                                                       #
###############################################################################

# Close any open System Preferences panes, to prevent them from overriding
# settings we're about to change
osascript -e 'tell application "System Preferences" to quit'

echo "This script will set up various MacOS environment properties for desktop and apps."

echo "Please enter the administrator password."
sudo -v

# Maintain admin access: update sudo time stamp until this script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


###############################################################################
# Menu, Dock, Desktop Spaces                                                  #
###############################################################################

#Apple Menu > Apple Icon > System Preferences > Dock > "Position on screen": Left
#Apple Menu > Apple Icon > System Preferences > Dock > Size: (medium / middle of scale)

# I'd like to have only Finder and Trash as permanent icons in the Dock.

echo " Dock: Get rid of all (default) app icons from the Dock"
defaults delete com.apple.dock persistent-apps
defaults delete com.apple.dock persistent-others

# Add Finder back to the Dock (if gone)
#defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/System/Library/CoreServices/Finder.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"

#echo " Dock: Show only open applications in the Dock"
#defaults write com.apple.dock static-only -bool true

echo " Dock: Set the icon size of Dock items to 36 pixels"
defaults write com.apple.dock tilesize -int 36

echo " Dock: Change minimize/maximize window effect"
defaults write com.apple.dock mineffect -string "scale"

# echo " Dock: Minimize windows into their application's icon"
#defaults write com.apple.dock minimize-to-application -bool true

echo " Dock: Enable spring loading for all Dock items"
defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true

echo " Dock: Show indicator lights for open applications in the Dock"
defaults write com.apple.dock show-process-indicators -bool true

echo " Dock: Speed up animations"
defaults write com.apple.dock expose-animation-duration -float 0.15

killall Dock


# Find how to automate this:

#Setting up multiple desktop spaces:
#https://www.cnet.com/how-to/how-to-set-up-multiple-desktops-spaces-on-your-mac/
#https://appleinsider.com/articles/18/10/12/how-to-use-spaces-apples-mostly-ignored-macos-mojave-productivity-feature

#May use any of these three options:
#1) press F3 key
#2) swipe upward with 3 (or 4) fingers
#3) assign a Hot Corner to Mission Control via System Preferences > Mission Control
#And then click on the plus symbol to add desktop spaces.  (Having 2 is good.)

#Maybe this could be done in a script using the "defaults" shell command and the
#config file "~/Library/Preferences/com.apple.spaces.plist", but this forum
#thread seems to indicate that might not be possible:
#https://apple.stackexchange.com/questions/243664/osx-el-capitan-reset-the-number-of-spaces

#Relevant quote: "Unfortunately OS X holds a copy of the file in memory, so if
#you just delete it or modify it, it doesn't make any difference as it just
#recreates the file with the same number of spaces."


###############################################################################
# Keyboard                                                                    #
###############################################################################

#Turn the Caps Lock key into another Control key (for easier, more ergonomic multi-key pressing, or "chording"):
#System Preferences > Keyboard > Keyboard > "Modifier Keys..." > Caps Lock Key: "^Control"

#Enable switching spaces using Control-<number>:
#System Preferences > Keyboard > Shortcuts > Mission Control > "Switch to Desktop 1"..."^1" (check)
#System Preferences > Keyboard > Shortcuts > Mission Control > "Switch to Desktop 2"..."^2" (check)


###############################################################################
# Finder                                                                      #
###############################################################################

echo " Finder: Allow quitting via menu; doing so will also hide desktop icons"
defaults write com.apple.finder QuitMenuItem -bool true
killall Finder

# To reverse previous setting.
#defaults write com.apple.finder QuitMenuItem -bool false
#killall Finder

echo " Finder: Allow quitting via ⌘ + Q; doing so will also hide desktop icons"
defaults write com.apple.finder QuitMenuItem -bool true

echo " Finder: Show path bar"
defaults write com.apple.finder ShowPathbar -bool true

echo " Finder: Use list view in all Finder windows by default"
# Four-letter codes for the other view modes: `icnv`, `clmv`, `glyv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

echo " Finder: Keep folders on top when sorting by name"
defaults write com.apple.finder _FXSortFoldersFirst -bool true

echo " Finder: Show all filename extensions"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

echo " Finder: When performing a search, search the current folder by default"
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"


###############################################################################
# Additional/Third-Party Apps                                                 #
###############################################################################

# NTFS for Mac
# iTerm (iTerm2)
# CleanMyMac 3
# CleanMyMac X
# Disk Drill
# DaisyDisk
# Disk Inventory X
# VirtualBox

# Flux

# Emacs
# Backup and Sync from Google
# Google Chrome
# Signal Private Messenger -- download from signal.org
# VLC
# zoom.us.app
# qbittorrent
# RStudio

# Used to have:
# Filezilla


###############################################################################
# iTerm2                                                                      #
###############################################################################

# Find how to automate this:

#iTerm > Preferences > Appearance > Tabs > "Preserve window size when tab bar shows or hides" (check)
#iTerm > Preferences > Appearance > Tabs > "Show tab bar in fullscreen" (uncheck)
#iTerm > Preferences > Appearance > Tabs > "Flash tab bar when switching tabs in fullscreen" (check)

# Make new default profile named "CleanProfile" with certain nice properties:
#iTerm > Preferences > Profiles > "Profile Name" >  ["+" and can name profile "CleanProfile"]
#iTerm > Preferences > Profiles > "Profile Name" > "CleanProfile" ["Other Actions..." > "Set as Default"]
#iTerm > Preferences > Profiles > "Profile Name" > "CleanProfile" > Window > Style: Full Screen
#iTerm > Preferences > Profiles > "Profile Name" > "CleanProfile" > Window > Screen: No Preference
#iTerm > Preferences > Profiles > "Profile Name" > "CleanProfile" > Window > Space:  Space 2 (*)  OR  Current Space
#(*) If using "Space 2", make sure to enable switching spaces using Control-<number> (see above).

#iTerm > Preferences > Profiles > "Profile Name" > "CleanProfile" > Left Option Key: Meta (check/select)
# Note the warning that appears when making this selection:
# "Warning: You have chosen to have an option key act as Meta. This option is useful for backward compatibility with older systems. The "+Esc" option is recommended for most users."


###############################################################################
# Terminal                                                                    #
###############################################################################

# If using Terminal (instead of the preferred iTerm2),
#Terminal > Preferences > Profiles > (Default) > Keyboard > "Use Option as Meta key" (check)


###############################################################################
# Google Chrome                                                               #
###############################################################################

echo " Google Chrome: Disable the all-too-sensitive backswipe on trackpads"
defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false



###############################################################################
# Wrap Up                                                                     #
###############################################################################

echo "Done. Note that some of these changes may require a logout/restart to take effect."


