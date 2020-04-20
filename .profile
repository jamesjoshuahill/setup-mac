#!/usr/bin/env bash
# shellcheck disable=SC1090,1091

# Load application-specific settings
for setting in "$HOME/.profile.d"/*; do
  source "$setting"
done

# Add ~/bin to path
PATH="$HOME/bin:$PATH"

# Editor
export EDITOR=nvim

# Prompt
export PS1='\[\033[34m\]\w\[\033[0m\] '
