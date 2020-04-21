#!/usr/bin/env bash

# Load Sensible Bash
# shellcheck disable=SC1090
source "$HOME/bin/sensible.bash"

set +o noclobber  # Allow overwriting files on stdout redirection '>'

alias reload='source "$HOME/.profile"'

export PATH="$HOME/bin:$PATH"
export CDPATH=".:$HOME/projects"
export EDITOR=nvim
export PS1='\[\033[34m\]\w\[\033[0m\] '
