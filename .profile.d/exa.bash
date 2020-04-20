#!/usr/bin/env bash

alias ll='exa --long --all --git'
alias tree='exa --tree'

# Add exa to HISTIGNORE (based on sensible.bash)
export HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history:clear:exa"
