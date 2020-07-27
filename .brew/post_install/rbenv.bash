#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
# shellcheck disable=SC1090
source "$DIR/log.bash"

default_ruby_version="2.7.1"

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

upgrade_ruby_build
install_ruby
update_ruby_gems
