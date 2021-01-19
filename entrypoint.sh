#!/bin/sh -l

set -e

export CI=true
export BROWSER=chromium:headless

sh -c "$*"
