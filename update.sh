#!/usr/bin/env bash

set -euo pipefail

main() {
  start
  cache_password

  configure_macos

  install_brew
  update_brew
  update_brew_bundle
  cleanup_brew

  set_shell

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

install_brew() {
  if hash brew 2>/dev/null; then
    echo "** Homebrew already installed"
    return
  fi

  echo "** Install Homebrew"
  yes '' | ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

update_brew() {
  echo "** Update Homebrew"
  brew update
}

update_brew_bundle() {
  echo "** Update Homebrew Bundle"
  brew bundle --verbose
}

cleanup_brew() {
  echo "** Cleanup Homebrew"
  brew cleanup
}

set_shell() {
  if ! grep "/usr/local/bin/bash" /etc/shells > /dev/null 2>&1; then
    echo "** Add Homebrew bash to system shells"
    echo '/usr/local/bin/bash' | sudo tee -a /etc/shells > /dev/null
  else
    echo "** Homebrew bash already added to system shells"
  fi

  echo "** Change shell to Homebrew bash"
  sudo chsh -s /usr/local/bin/bash
}

finish() {
  echo "** Update finished."
  echo
}

main
