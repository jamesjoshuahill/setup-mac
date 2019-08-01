#!/usr/bin/env bash

# Configure bash history
shopt -s histappend   # Append instead of overwrite

# Add ~/bin to path
PATH="$HOME/bin:$PATH"

# Aliases
alias ll='ls -alGh'
# https://www.atlassian.com/git/tutorials/dotfiles
alias s='git --git-dir="$HOME/.setup/" --work-tree="$HOME"'
