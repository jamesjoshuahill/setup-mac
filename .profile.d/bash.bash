#!/usr/bin/env bash
# shellcheck disable=SC1090

# Load Sensible Bash
source "$HOME/bin/sensible.bash"
set +o noclobber  # Allow overwriting files on stdout redirection '>'

# Convenience functions
alias reload='source "$HOME/.profile"'
source "$HOME/bin/mcd.bash"

export PATH="$HOME/bin:$PATH"
export CDPATH=".:$HOME/projects"
export EDITOR=nvim
export PS1='\[\033[34m\]\w\[\033[0m\] '
