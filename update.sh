#!/usr/bin/env bash

set -euo pipefail

main() {
  start
  cache_password

  configure_macos

  finish
}

start() {
  echo "** Start update"
}

cache_password() {
  echo "** Cache password"
  sudo -K
  sudo true;
}

configure_macos() {
  echo "** Configure macOS"
  # set menu clock
  # see http://www.unicode.org/reports/tr35/tr35-31/tr35-dates.html#Date_Format_Patterns
  defaults write com.apple.menuextra.clock "DateFormat" 'EEE d MMM  h:mm a'
  killall SystemUIServer

  # hide the dock
  defaults write com.apple.dock autohide -bool true
  killall Dock

  # fast key repeat rate, requires reboot to take effect
  defaults write ~/Library/Preferences/.GlobalPreferences KeyRepeat -int 1
  defaults write ~/Library/Preferences/.GlobalPreferences InitialKeyRepeat -int 15
}

finish() {
  echo "** Update finished."
  echo
}

main
