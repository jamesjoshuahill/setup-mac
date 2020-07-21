#!/usr/bin/env bash

log() {
  local message=$1
  echo -e "\033[1m--> ${message}\033[0m"
}
