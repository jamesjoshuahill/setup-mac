#!/usr/bin/env bash

set -e

curl https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \
  --fail --silent --show-error --create-dirs \
  --output "$HOME/.local/share/nvim/site/autoload/plug.vim"

nvim +PlugUpdate +qall

