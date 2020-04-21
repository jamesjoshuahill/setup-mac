#!/usr/bin/env bash

for initializer in "$HOME/.profile.d"/*.bash; do
  # shellcheck disable=SC1090
  source "$initializer"
done
