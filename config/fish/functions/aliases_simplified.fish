#!/usr/bin/env fish
# filename: aliases.fish
# purpose: For defining custom commands in the shell.

# This file is sourced from ~/.config/fish/config.fish
# tried using bass to convert from bash to fish, but didn't figure it out


## functions:
#function ls_hide_backups
#    ls -d *[^~]  # mac version of "ls -B" (ignore-backups)
#    # fish can't do this?
#    # https://github.com/fish-shell/fish-shell/issues/3681
#    # This doesn't work either:
#    # ls -d (string match --quiet --regex *~)
#end
#
##alias ls=ls_hide_backups  # not-so-great: `ls foldername` doesn't work
#alias l=ls_hide_backups
alias l='ls --hide="*~"'

function vmlist
    VBoxManage list runningvms
end

