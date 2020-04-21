#!/usr/bin/env bash

# Git clone shortcut
function clone() {
  repo=$1

  if [ -z "$repo" ]
  then
    >&2 echo "usage: clone GIT_URL"
    return
  fi

  # Source: git-clone.sh
  # https://github.com/git/git/blob/c6fef0bbea485ff8aec979177ee5c1c568fffc55/git-clone.sh#L223-L232
  #
  # Derive one from the repository name
  # Try using "humanish" part of source repo if user didn't specify one
  if test -f "$repo"
  then
    # Cloning from a bundle
    dir=$(echo "$repo" | sed -e 's|/*\.bundle$||' -e 's|.*/||g')
  else
    dir=$(echo "$repo" |
      sed -e 's|/$||' -e 's|:*/*\.git$||' -e 's|.*[/:]||g')
  fi

  dir="$HOME/projects/$dir"

  git clone "$repo" "$dir" || return
  cd "$dir" || return
}
