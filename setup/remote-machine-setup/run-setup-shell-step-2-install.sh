#!/usr/bin/env bash
# filename: run-setup-shell-step-2-install.sh
# purpose: Automate installing/updating shells and utilities.


# For GNU/Linux
if [[ "$(uname -s)" = "Linux" ]] ; then

	# By default DO NOT do this. Some systems are flaky & delicate. Do no harm!
	# First update/upgrade package manager, APT (apt).
	##echo "Running \"aptup\" prior to installing any missing desired packages."
	##source $r/.config/bash/bashrc_aliases_linux # contains definition of `aptup`
	##aptup

	# Install missing packages
	echo "Installing any missing desired packages..."

	for package in $(cat $setup/packages-to-install.txt) ; do
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

	# NOPE!:
	# See how update goes now:
	##echo "Running \"aptup\" again after any installs (or none)."
	##aptup
fi


# For the sake of any other users, let's just keep the default shell the same.
# For both GNU/Linux and MacOS, set zsh as default shell
# (if it's not already the default (SHELL) and if it's present)
##if [[ "$SHELL" != "/bin/zsh" ]] ; then
##	RESULT_STRING="$(cat /etc/shells | grep "^/bin/zsh$")"
##	if [[ -n "$RESULT_STRING" ]] ; then
##		chsh -s /bin/zsh
##		echo "Note: Open a new shell to start with the new default (zsh)."
##	fi
##fi
