#!/usr/bin/env bash

default_node_version="12.18.2"

install_node() {
  log "Install Node.js ${default_node_version}"

  export NVM_DIR="$HOME/.nvm"
  set +u
  # shellcheck disable=SC1091
  source "/usr/local/opt/nvm/nvm.sh"
  set -u

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
