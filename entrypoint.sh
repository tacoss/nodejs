#!/bin/sh -l

set -e

export BROWSER=chromium:headless
export HOME=/tmp
export CI=true

sh -c "git config --global --add safe.directory /github/workspace"

sh -c "$*"
