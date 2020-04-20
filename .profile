#!/usr/bin/env bash
# shellcheck disable=SC1090,1091

# Load application-specific settings
for setting in "$HOME/.profile.d"/*; do
  source "$setting"
done

set +o noclobber  # Allow overwriting files on stdout redirection '>'

alias reload='source "$HOME/.profile"'

export PATH="$HOME/bin:$PATH"
export CDPATH=".:$HOME/projects"
export EDITOR=nvim
export PS1='\[\033[34m\]\w\[\033[0m\] '
