#!/bin/sh

set -e

if [[ -f Makefile ]]; then
  sh -c "make $*"
else
  sh -c "npm $*"
fi

