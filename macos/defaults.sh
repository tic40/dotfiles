#!/bin/bash
set -euo pipefail

# Keyboard
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Finder
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write com.apple.finder AppleShowAllFiles -bool true
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Dock
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock show-recents -bool false

# Menu bar
defaults -currentHost write com.apple.controlcenter BatteryShowPercentage -bool true

# Screenshots
mkdir -p "$HOME/Pictures/Screenshots"
defaults write com.apple.screencapture location "$HOME/Pictures/Screenshots"

killall Finder Dock SystemUIServer ControlCenter 2>/dev/null || true
echo "macOS defaults applied (keyboard settings take effect after logout)"
