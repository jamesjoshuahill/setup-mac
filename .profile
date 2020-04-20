#!/usr/bin/env bash
# shellcheck disable=SC1090,1091

# Load application-specific settings
for setting in "$HOME/.profile.d"/*; do
  source "$setting"
done

# Configure Sensible Bash
set +o noclobber  # Allow overwriting files on stdout redirection '>'
CDPATH=".:$HOME/projects"  # Add ~/projects to CDPATH
export HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history:clear:exa"  # Add exa to HISTIGNORE

# Add ~/bin to path
PATH="$HOME/bin:$PATH"

# Use GNU make
PATH="/usr/local/opt/make/libexec/gnubin:$PATH"

# Go
source "$HOME/.gimme/envs/latest.env" &> /dev/null
export PATH="$HOME/go/bin:$PATH"

# Ruby
eval "$(rbenv init -)"

# Link rubies installed with ruby-build to Homebrew's OpenSSL 1.1 so that
# they use the latest version of OpenSSL installed
RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
export RUBY_CONFIGURE_OPTS

# Node.js
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"

# direnv
eval "$(direnv hook bash)"

# git-author
export GIT_TOGETHER_NO_SIGNOFF=1  # Use 'Co-authored by: '

# Enable bash completion
export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] &&
  . "/usr/local/etc/profile.d/bash_completion.sh"

# Editor
export EDITOR=nvim

# Prompt
export PS1='\[\033[34m\]\w\[\033[0m\] '
