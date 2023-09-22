#!/usr/bin/env bash
# Can be executed in various shells: Bash, PowerShell, etc.

# Command to obtain list:
# Bash:
# code --list-extensions | xargs -L 1 echo "code --install-extension"
# PowerShell:
# code --list-extensions | % { "code --install-extension $_" }

# Executing this code:
# Bash:
# bash ~/.config-repo/config/vscode/extensions-manual.sh
# PowerShell:
# .$Home\.config-repo\config\vscode\extensions-manual.sh

code --install-extension Compulim.indent4to2
code --install-extension DavidAnson.vscode-markdownlint
code --install-extension dbaeumer.vscode-eslint
code --install-extension eamodio.gitlens
code --install-extension earshinov.permute-lines
code --install-extension esbenp.prettier-vscode
code --install-extension henriiik.vscode-sort
code --install-extension MarkosTh09.color-picker
code --install-extension mrmlnc.vscode-apache
code --install-extension ms-azuretools.vscode-docker
code --install-extension ms-python.pylint
code --install-extension ms-python.python
code --install-extension ms-python.vscode-pylance
code --install-extension ms-toolsai.jupyter
code --install-extension ms-toolsai.jupyter-keymap
code --install-extension ms-toolsai.jupyter-renderers
code --install-extension ms-vscode-remote.remote-wsl
code --install-extension ms-vscode.powershell
code --install-extension pucelle.vscode-css-navigation
code --install-extension stylelint.vscode-stylelint
code --install-extension timonwong.shellcheck
code --install-extension vscodevim.vim
code --install-extension ybaumes.highlight-trailing-white-spaces
