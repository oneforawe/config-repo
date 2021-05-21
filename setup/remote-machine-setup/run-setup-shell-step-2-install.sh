#!/usr/bin/env bash
# filename: run-setup-shell-step-2-install.sh
# purpose: Automate installing/updating shells and utilities.


# Set variables:
CONFIG_ROOT="$HOME"
CONFIG_FOLDER=".config-files"
CONFIG_LOCATION="$HOME/$CONFIG_FOLDER"

setup="$src/setup/remote-machine-setup"

r=$CONFIG_ROOT
src=$CONFIG_LOCATION



# For GNU/Linux
if [[ `uname -s` = "Linux" ]] ; then

    # By default DO NOT do this. Some systems are flaky & delicate. Do no harm!
    # First update/upgrade package manager.
    # APT
    ##echo "Running \"aptup\" prior to installing any missing desired packages."
    ##source $r/.config/bash/bashrc_aliases_linux # contains definition of `aptup`
    ##aptup

    echo "Installing any missing desired packages..."
    for package in `cat $setup/packages-to-install.txt` ; do
        if [[ -z `which $package` ]] ; then
            sudo apt-get install $package
        fi
    done

    # NOPE!:
    # See how update goes now:
    ##echo "Running \"aptup\" again after any installs (or none)."
    ##aptup
fi


# For the sake of any other users, let's just keep the default shell the same.
# For both GNU/Linux and MacOS, set zsh as default shell
# (if it's not already the default (SHELL) and if it's present)
##if [[ "$SHELL" != "/bin/zsh" ]] ; then
##    RESULT_STRING="$(cat /etc/shells | grep "^/bin/zsh$")"
##    if [[ -n "RESULT_STRING" ]] ; then
##        chsh -s /bin/zsh
##        echo "Note: Open a new shell to start with the new default (zsh)."
##    fi
##fi
