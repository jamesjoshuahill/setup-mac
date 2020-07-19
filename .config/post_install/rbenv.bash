#!/usr/bin/env bash

default_ruby_version="2.7.1"

main() {
  upgrade_ruby_build
  install_ruby
  update_ruby_gems
}

log() {
  local message=$1
  echo -e "\033[1m--> ${message}\033[0m"
}

upgrade_ruby_build() {
  log "Upgrade ruby-build"
  brew upgrade ruby-build
}

install_ruby() {
  log "Install Ruby ${default_ruby_version}"
  eval "$(rbenv init -)"
  rbenv install $default_ruby_version --skip-existing
  rbenv global $default_ruby_version
}

update_ruby_gems() {
  log "Update Ruby Gems"
  gem update --system
}

main
