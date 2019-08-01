#!/usr/bin/env bash

# Configure bash history
shopt -s histappend   # Append instead of overwrite

# Enable bash completion
# shellcheck disable=SC1091
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# Add ~/bin to path
PATH="$HOME/bin:$PATH"

# Use Homebrew ruby
export PATH="/usr/local/opt/ruby/bin:$PATH"

# Aliases
alias ll='ls -alGh'

# Setup
# https://www.atlassian.com/git/tutorials/dotfiles
alias setup-git='git --git-dir="$HOME/.setup/" --work-tree="$HOME"'
alias s='setup-git'
