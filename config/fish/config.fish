#!/usr/bin/env fish
# filename: config.fish
# purpose: A config file for the fish shell, "equivalent to .bashrc".


# So, apparently, this is a config file for all interactive fish shells.
# FISH is, afterall, the Friendly *Interactive* SHell,
# so maybe all shell instances are interactive.

# Known issues:
# 1. In MacOs, in a shell terminal (eg, Terminal or iTerm2), when using tmux,
#    with a fish terminal prompt customized to be multiple lines,
#    the prompt advances and reprints
#    (instead of properly reprinting in place, if reprinting at all)
#    a) when changing from vi insert mode to vi normal mode
#    b) when pasting text
#    c) maybe other scenarios
#       (see https://github.com/fish-shell/fish-shell/issues/3481)

# This file doesn't really seem to be totally equivalent to .bashrc, because
# not all of the other "config" files have to be sourced here.  Some "configs"
# happen in other files in this folder and in the `functions` folder.

fish_vi_key_bindings
#source ~/.config/fish/functions/aliases.fish
source ~/.config/fish/functions/aliases_simplified.fish

# Use `fuck` command - for suggesting command-line mistake re-writes.
thefuck --alias | source

