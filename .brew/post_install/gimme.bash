#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
# shellcheck disable=SC1090
source "$DIR/log.bash"

default_go_version="1.14.6"

install_go() {
  log "Install Go ${default_go_version}"
  gimme $default_go_version
}

install_go
