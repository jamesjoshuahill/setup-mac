#!/usr/bin/env bash

alias update_vscode_extension_list='code --list-extensions > "$HOME/Library/ApplicationSupport/Code/User/extensions.txt"'

function install_vscode_extensions() {
  comm -13 <(code --list-extensions) "$HOME/Library/ApplicationSupport/Code/User/extensions.txt" |
    xargs -n 1 code --force --install-extension
}
