#!/usr/bin/env bash

eval "$(rbenv init -)"

# Link rubies installed with ruby-build to Homebrew's OpenSSL 1.1 so that
# they use the latest version of OpenSSL installed
RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
export RUBY_CONFIGURE_OPTS
