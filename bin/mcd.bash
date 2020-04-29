#!/usr/bin/env bash

mcd() {
  dir=$1

  if [ -z "$dir" ]
  then
    >&2 echo "Create and change into a new directory.

Usage:
  mcd DIRECTORY"
    return
  fi

  mkdir -p "$dir" && cd "$dir" || return
}
