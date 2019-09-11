#!/usr/bin/env bash
# filename: run-setup-shell-full.sh
# purpose: Automate setting up system with configuration files.

# TODO: Create function that doesn't just link but checks for pre-existing
#       files, saves them into a backup location such as
#       ~/.config-files-replaced/files-2019-05-22-h20-m34-s21/zshrc
#       and then creates the link (complaining if not succeeding, both in the
#       linking process and perhaps testing the link somehow).
# TODO: Get private info from user to put into private config files.
#       (How many files will be private? How important is it that they be
#        private? What's the best way to keep them private? Hm, maybe I could
#        have a template here to download, add info to, and place in an
#        encrypted location that other things read with interactive password
#        access. There could be slightly private, with simple password access,
#        and then super private, with more rigorous protection.)
#       EG: email address for .gitconfig (?)
#       mkdir -pv $HOME/.config-files-private/config/git/gitconfig
#       ln -sFfh ~/.config-files-private/config/git/gitconfig ~/.gitconfig


# Set variables:
CONFIG_ROOT="$HOME"
CONFIG_FOLDER=".config-files"
CONFIG_LOCATION="$HOME/$CONFIG_FOLDER"

r=$CONFIG_ROOT
src=$CONFIG_LOCATION


source $src/setup/run-setup-shell-step-1-link-files.sh
source $src/setup/run-setup-shell-step-2-install.sh
#source $src/setup/run-setup-shell-step-3-python.sh
#source $src/setup/run-setup-shell-step-4-datasci.sh

