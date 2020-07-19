#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
# shellcheck disable=SC1090
source "$DIR/log.bash"

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
    echo "User shell already set to Homebrew bash."
    return
  fi

  chsh -s /usr/local/bin/bash
}

set_shell
