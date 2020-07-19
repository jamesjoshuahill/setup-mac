#!/usr/bin/env bash

alias install_vscode_extensions='xargs -n 1 code --force --install-extension < "$HOME/Library/Application Support/Code/User/extensions.txt"'
alias update_vscode_extension_list='code --list-extensions > "$HOME/Library/Application Support/Code/User/extensions.txt"'
