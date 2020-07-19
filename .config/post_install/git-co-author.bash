#!/usr/bin/env bash

main() {
  install_git-co-author
}

log() {
  local message=$1
  echo -e "\033[1m--> ${message}\033[0m"
}

install_git-co-author() {
  log "Install git-co-author"
  local temp_file
  temp_file=$(mktemp)
  curl https://raw.githubusercontent.com/jamesjoshuahill/git-co-author/master/git-co-author \
    --silent --show-error --output "$temp_file"
  install -C "$temp_file" /usr/local/bin/git-co-author
  touch "$HOME/.config/git/commit-template"
}

main
