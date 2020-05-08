#!/usr/bin/env bash

export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"

# shellcheck disable=SC1091
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] &&
  source "/usr/local/etc/profile.d/bash_completion.sh"
