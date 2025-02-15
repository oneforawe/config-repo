#!/usr/bin/env bash
# filename: run-setup-shell-step-2-install.sh
# purpose: Automate installing/updating shells and utilities.


# For GNU/Linux
if [[ "$(uname -s)" = "Linux" ]] ; then

	# First update/upgrade package manager, APT (apt).
	echo "Running \"aptup\" prior to installing any missing desired packages."
	source $r/.config/bash/bashrc_aliases_linux # contains definition of `aptup`
	aptup

	# Install missing packages
	echo "Installing any missing desired packages..."

	for package in $(cat $src/setup/packages-to-install.txt) ; do
		if [[ -z $(which $package) ]] ; then
			sudo apt install $package
		fi
	done
	for package in $(cat $src/setup/packages-to-install_linux.txt) ; do
		if [[ -z $(which $package) ]] ; then
			sudo apt install $package
		fi
	done

	# Check/Install gh (the GitHub-CLI)
	if [[ -z $(which gh) ]] ; then
		# See https://github.com/cli/cli/blob/trunk/docs/install_linux.md
		curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg
		echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
		sudo apt update
		sudo apt install gh
	fi

	# See how update goes now:
	echo "Running \"aptup\" again after any installs (or none)."
	aptup
fi


# For MacOS
if [[ "$(uname -s)" = "Darwin" ]] ; then

	# First update/upgrade package manager, Homebrew (brew).
	echo "Making sure Homebrew package manager is installed and ready..."
	# pre-requisite:
	if [[ -z $(which xcode-select) ]] ; then xcode-select --install ; fi
	# Install Homebrew (if not already installed):
	if [[ -z $(which brew) ]] ; then
		/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	fi
	# Make sure things are okay so far:
	brew doctor
	# Make sure a brew-update works (using alias `bup`):
	source $r/.config/bash/bashrc_aliases_mac # contains definition of `bup`
	echo "Running \"bup\" prior to installing any missing desired packages..."
	bup

	# Find what's already installed (put in array)
	declare -a arrInstalledPackages
	for package in $(brew list) ; do
		arrInstalledPackages+=($package)
	done

	# Install missing packages
	echo "Installing any missing desired packages..."
	for package in $(cat $src/setup/packages-to-install.txt) ; do
		if [[ "  ${arrInstalledPackages[*]}  " != *" $package "* ]] ; then
			brew install $package
		fi
	done
	for package in $(cat $src/setup/packages-to-install_mac.txt) ; do
		if [[ "  ${arrInstalledPackages[*]}  " != *" $package "* ]] ; then
			brew install $package
		fi
	done

	# Utility for image-viewing in iTerm2, even over ssh:
	if [[ ! -r ~/.local/bin/imgcat ]] ; then
		wget https://iterm2.com/utilities/imgcat
		chmod 755 ./imgcat
		mv ./imgcat ~/.local/bin/
	fi

	# See how update goes now:
	echo "Running \"bup\" again after any installs (or none)..."
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


# Make sure OMZ plugins are present.
if [[ -d ~/.config/zsh/oh-my-zsh/custom/plugins/ ]] ; then
	if [[ ! -r ~/.config/zsh/oh-my-zsh/custom/plugins/zsh-autosuggestions ]] ; then
		git clone https://github.com/zsh-users/zsh-autosuggestions ~/.config/zsh/oh-my-zsh/custom/plugins/
	fi
	if [[ ! -r ~/.config/zsh/oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]] ; then
		git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.config/zsh/oh-my-zsh/custom/plugins/
	fi
fi


# For both GNU/Linux and MacOS, set zsh as default shell
# (if it's not already the default (SHELL) and if it's present)
if [[ "$SHELL" != "/bin/zsh" ]] ; then
	RESULT_STRING="$(cat /etc/shells | grep "^/bin/zsh$")"
	if [[ -n "$RESULT_STRING" ]] ; then
		chsh -s /bin/zsh
		echo "Note: Open a new shell to start with the new default (zsh)."
	fi
fi
