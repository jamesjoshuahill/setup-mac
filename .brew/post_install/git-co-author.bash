#!/usr/bin/env bash

install_git-co-author() {
  log "Install git-co-author"
  local temp_file
  temp_file=$(mktemp)
  curl https://raw.githubusercontent.com/jamesjoshuahill/git-co-author/master/git-co-author \
    --silent --show-error --output "$temp_file"
  install -C "$temp_file" /usr/local/bin/git-co-author
  touch "$HOME/.config/git/commit-template"
}

install_git-co-author
