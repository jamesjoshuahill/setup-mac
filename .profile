#!/usr/bin/env bash

for setting in "$HOME/.profile.d"/*; do
  # shellcheck disable=SC1090
  source "$setting"
done
