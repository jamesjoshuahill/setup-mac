#!/usr/bin/env bash

default_go_version="1.14.6"

main() {
  install_go
}

log() {
  local message=$1
  echo -e "\033[1m--> ${message}\033[0m"
}

install_go() {
  log "Install Go ${default_go_version}"
  gimme $default_go_version
}

main
