#!/usr/bin/env bash
# filename: config-env.sh
# purpose: Define environment variables for use in these user configuration
#   setup scripts.

CONFIG_ROOT="$HOME"
CONFIG_FOLDER=".config-repo"
CONFIG_LOCATION="$HOME/$CONFIG_FOLDER"

r=$CONFIG_ROOT
src=$CONFIG_LOCATION

setup="$src/setup/remote-machine-setup"