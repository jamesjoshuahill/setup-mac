#!/usr/bin/env bash
# shellcheck disable=SC1090,1091

# Load application-specific settings
for setting in "$HOME/.profile.d"/*; do
  source "$setting"
done

# Allow overwriting files on stdout redirection '>'
set +o noclobber

# Alias to reload bash profile
alias reload='source "$HOME/.profile"'

# Add ~/bin to path
PATH="$HOME/bin:$PATH"

# Add ~/projects to CDPATH
CDPATH=".:$HOME/projects"

# Set default editor
export EDITOR=nvim

# Set prompt
export PS1='\[\033[34m\]\w\[\033[0m\] '
