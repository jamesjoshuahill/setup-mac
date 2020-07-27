#!/usr/bin/env bash

install_vscode_extensions() {
  log "Install VS Code extensions"
  comm -13 <(code --list-extensions) "$HOME/Library/ApplicationSupport/Code/User/extensions.txt" |
    xargs -n 1 code --force --install-extension
}

install_vscode_extensions
