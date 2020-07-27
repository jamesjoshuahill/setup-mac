#!/usr/bin/env bash

export PROMPT_COMMAND="__prompt_command;$PROMPT_COMMAND"

__prompt_command() {
  # shellcheck disable=SC2181
  if [[ $? -eq 0 ]]
  then
    export PS1='\[\033[01;34m\]\w\[\033[0m\] '
  else
    export PS1='\[\033[01;31m\]\w\[\033[0m\] '
  fi
}
