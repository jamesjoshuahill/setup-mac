#!/usr/bin/env bash

set -euo pipefail

main() {
  start

  update_macos
  configure_macos

  install_brew
  update_brew
  update_brew_bundle
  cleanup_brew

  remove_icons_from_dock
  set_shell

  set_global_ruby
  update_ruby_gems

  install_atom_packages

  finish
}

log()  {
  local message=$1
  echo -e "\e[1m${message}\e[0m"
}

start() {
  log "** Start update"
}

update_macos() {
  log "** Update macOS"
  softwareupdate --install --all
}

configure_macos() {
  log "** Configure macOS"
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
  log "** Install Homebrew"
  if hash brew 2>/dev/null; then
    echo "Homebrew already installed."
    return
  fi

  yes '' | ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

update_brew() {
  log "** Update Homebrew"
  brew update
}

update_brew_bundle() {
  log "** Update Homebrew Bundle"
  brew bundle --verbose
}

cleanup_brew() {
  log "** Cleanup Homebrew"
  brew cleanup
}

remove_icons_from_dock() {
  log "** Remove icons from dock"
  set +o pipefail
  dockutil --list | cut -d"$(printf '\t')" -f1 | grep -v Downloads | xargs -n1 dockutil --remove --no-restart
  set -o pipefail
}

set_shell() {
  log "** Set shell"
  if ! grep "/usr/local/bin/bash" /etc/shells > /dev/null 2>&1; then
    echo '/usr/local/bin/bash' | sudo tee -a /etc/shells > /dev/null
    echo "Added Homebrew bash to system shells."
  fi

  sudo chsh -s /usr/local/bin/bash
  chsh -s /usr/local/bin/bash
}

set_global_ruby() {
  log "** Set global Ruby"
  local version="2.6.3"
  eval "$(rbenv init -)"
  rbenv install $version --skip-existing
  rbenv global $version
}

update_ruby_gems() {
  log "** Update Ruby Gems"
  gem update --system

  gem install bundler
  gem install irb
  gem install rspec
}

install_atom_packages() {
  log "** Install Atom packages"
  apm install --production --packages-file "$HOME/.atom/packages.txt"
}

finish() {
  log "** Update finished"
  echo
}

main
