#!/usr/bin/env bash

default_go_version="1.14.6"

install_go() {
  log "Install Go ${default_go_version}"
  gimme $default_go_version
}

install_go
