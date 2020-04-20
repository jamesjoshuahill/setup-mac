#!/usr/bin/env bash

alias reload='source "$HOME/.profile"'

# bat
alias cat='bat'

# direnv
alias da='direnv allow'

# exa
alias ll='exa --long --all --git'
alias tree='exa --tree'

# Setup
# https://www.atlassian.com/git/tutorials/dotfiles
alias setup-git='git --git-dir="$HOME/.setup/" --work-tree="$HOME"'
alias s='setup-git'
