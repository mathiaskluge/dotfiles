#!/bin/bash

# Get the absolute path of the directory where the script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

. $SCRIPT_DIR/utils.sh

apply_osx_system_defaults() {
    info "Applying OSX system defaults..."

    # Enable key repeats
    defaults write -g ApplePressAndHoldEnabled -bool false

    # Disable prompting to use new exteral drives as Time Machine volume
    defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

    # Hide external hard drives on desktop
    defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false

    # Hide hard drives on desktop
    defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false

    # Hide removable media hard drives on desktop
    defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false

    # Hide mounted servers on desktop
    defaults write com.apple.finder ShowMountedServersOnDesktop -bool false

    # Hide icons on desktop
    defaults write com.apple.finder CreateDesktop -bool false

    # Avoid creating .DS_Store files on network volumes
    defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

    # Show path bar
    defaults write com.apple.finder ShowPathbar -bool true

    # Show hidden files inside the finder
    defaults write com.apple.finder "AppleShowAllFiles" -bool true

    # Show Status Bar
    defaults write com.apple.finder "ShowStatusBar" -bool true

    # Do not show warning when changing the file extension
    defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

    # Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
    defaults write com.apple.screencapture type -string "png"

    # Set weekly software update checks
    defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 7

    # Set Dock autohide
    defaults write com.apple.dock autohide -bool true
    defaults write com.apple.dock largesize -float 128
    defaults write com.apple.dock "minimize-to-application" -bool true
    defaults write com.apple.dock tilesize -float 32
}

if [ "$(basename "$0")" = "$(basename "${BASH_SOURCE[0]}")" ]; then
    apply_osx_system_defaults
fi
