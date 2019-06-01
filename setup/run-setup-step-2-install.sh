#!/usr/bin/env bash
# filename: run-setup-step-2-install.sh
# purpose: Automate installing/updating shells and utilities.


# Set variables:
CONFIG_ROOT="$HOME"
CONFIG_FOLDER=".config-files"
CONFIG_LOCATION="$HOME/$CONFIG_FOLDER"

r=$CONFIG_ROOT
src=$CONFIG_LOCATION



# For GNU/Linux
if [[ `uname -s` = "Linux" ]] ; then

    # First update/upgrade package manager.
    # APT
    printf "Running \"aptup\" prior to installing any missing desired packages.\n"
    aptup

    printf "Installing any missing desired packages...\n"
    for package in `cat packages-to-install.txt` ; do
        if [[ -z `which $package` ]] ; then
            apt-get install $package
        fi
    done
    # install thefuck

    # See how update goes now:
    printf "Running \"aptup\" again after any installs (or none).\n"
    aptup
fi


# For MacOS
if [[ `uname -s` = "Darwin" ]] ; then

    # First update/upgrade package manager.
    # Homebrew (brew)
    printf "Making sure Homebrew package manager is installed and ready...\n"
    # pre-requisite:
    if [[ -z `which xcode-select` ]] ; then xcode-select --install ; fi
    # Install Homebrew (if not already installed):
    if [[ -z `which brew` ]] ; then
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi
    # Make sure things are okay so far:
    brew doctor
    # Make sure a brew-update works (using alias `bup`):
    source $r/.config/bash/bashrc_aliases_mac # contains definition of `bup`
    printf "Running \"bup\" prior to installing any missing desired packages...\n"
    bup

    # Find what's already installed (put in array)
    declare -a arrInstalledPackages
    for package in `brew list` ; do
        arrInstalledPackages+=($package)
    done

    # Install missing packages
    printf "Installing any missing desired packages...\n"
    for package in $(cat packages-to-install.txt) ; do
        if [[ "  ${arrInstalledPackages[*]}  " != *" $package "* ]] ; then
            brew install $package
        fi
    done
    if [[ "  ${arrInstalledPackages[*]}  " != *" thefuck "* ]] ; then
        brew install thefuck
    fi

    # See how update goes now:
    printf "Running \"bup\" again after any installs (or none)...\n"
    bup

    # Note: `rsync --version` doesn't match
    #       `brew info rsync` or `brew install rsync`

    # Caveats
    # unzip is keg-only, which means it was not symlinked into /usr/local,
    # because macOS already provides this software and installing another version in
    # parallel can cause all kinds of trouble.
    # If you need to have unzip first in your PATH run:
    #  echo 'export PATH="/usr/local/opt/unzip/bin:$PATH"' >> ~/.bash_profile
fi

