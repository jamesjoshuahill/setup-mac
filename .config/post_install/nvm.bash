#!/usr/bin/env bash

default_node_version="12.18.2"

main() {
  install_node
  install_yarn
}

log() {
  local message=$1
  echo -e "\033[1m--> ${message}\033[0m"
}

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

main
