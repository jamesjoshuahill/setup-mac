#!/usr/bin/env bash

main() {
  set_shell
}

log() {
  local message=$1
  echo -e "\033[1m--> ${message}\033[0m"
}

set_shell() {
  log "Set user shell"
  local homebrew_bash="/usr/local/bin/bash"
  if ! grep $homebrew_bash /etc/shells &> /dev/null
  then
    echo $homebrew_bash | sudo tee -a /etc/shells > /dev/null
    echo "Added Homebrew bash to system shells."
  fi

  local user_shell
  user_shell=$(dscl /Local/Default -read "/Users/$USER" UserShell | cut -d' ' -f2)
  if [ "$user_shell" = $homebrew_bash ]
  then
    return
  fi

  chsh -s /usr/local/bin/bash
}

main
