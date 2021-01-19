#!/bin/sh -l

set -e
export CI=true
sh -c "$*"
