#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
# shellcheck disable=SC1090
source "$DIR/log.bash"

install_vscode_extensions() {
  log "Install VS Code extensions"
  comm -13 <(code --list-extensions) "$HOME/Library/ApplicationSupport/Code/User/extensions.txt" |
    xargs -n 1 code --force --install-extension
}

install_vscode_extensions
