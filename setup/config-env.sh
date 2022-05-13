#!/usr/bin/env bash
# filename: config-env.sh
# purpose: Define environment variables for use in these user configuration
#   setup scripts.

CONFIG_ROOT="$HOME"
CONFIG_FOLDER=".config-repo"
CONFIG_LOCATION="$HOME/$CONFIG_FOLDER"

export r=$CONFIG_ROOT
export src=$CONFIG_LOCATION

export setup="$src/setup"