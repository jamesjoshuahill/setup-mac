#!/usr/bin/env bash

# Sensible bash
# shellcheck disable=SC1090
source "$HOME/sensible.bash"

# Enable bash completion
# shellcheck disable=SC1091
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# Add ~/bin to path
PATH="$HOME/bin:$PATH"

# Enable rbenv
eval "$(rbenv init -)"

# Aliases
alias ll='ls -alGh'

# Setup
# https://www.atlassian.com/git/tutorials/dotfiles
alias setup-git='git --git-dir="$HOME/.setup/" --work-tree="$HOME"'
alias s='setup-git'

# Prompt
export PS1='\[\033[93;1m\]\w\[\033[0m\] '
