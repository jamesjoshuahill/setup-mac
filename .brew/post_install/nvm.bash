#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
# shellcheck disable=SC1090
source "$DIR/log.bash"

default_node_version="12.18.2"

install_node() {
  log "Install Node.js ${default_node_version}"

  export NVM_DIR="$HOME/.nvm"
  # shellcheck disable=SC1091
  source "/usr/local/opt/nvm/nvm.sh"

  nvm install $default_node_version
  nvm alias default $default_node_version
  npm completion > /usr/local/etc/bash_completion.d/npm
}

install_yarn() {
  log "Install yarn"
  npm install yarn --global
}

install_node
install_yarn
