#!/usr/bin/env bash

main() {
  install_vscode_extensions
}

log() {
  local message=$1
  echo -e "\033[1m--> ${message}\033[0m"
}

install_vscode_extensions() {
  log "Install VS Code extensions"
  comm -13 <(code --list-extensions) "$HOME/Library/ApplicationSupport/Code/User/extensions.txt" |
    xargs -n 1 code --force --install-extension
}

main
