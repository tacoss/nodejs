#!/bin/sh

set -e

cmd=npm
if [[ -f Makefile ]]; then
  cmd=make
fi

sh -c "CI=true $cmd $*"
