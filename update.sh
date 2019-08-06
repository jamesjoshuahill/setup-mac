#!/usr/bin/env bash

set -euo pipefail

main() {
  start
  cache_password

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

update_macos() {
  echo "** Update macOS"
  softwareupdate --install --all
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

remove_icons_from_dock() {
  echo "** Remove icons from dock"
  set +o pipefail
  dockutil --list | cut -d"$(printf '\t')" -f1 | grep -v Downloads | xargs -n1 dockutil --remove --no-restart
  set -o pipefail
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

set_global_ruby() {
  echo "** Set global Ruby"
  local version="2.6.3"
  eval "$(rbenv init -)"
  rbenv install $version --skip-existing
  rbenv global $version
}

update_ruby_gems() {
  echo "** Update Ruby Gems"
  gem update --system
  gem install bundler
  gem install irb
  gem install rspec
}

finish() {
  echo "** Update finished."
  echo
}

main
