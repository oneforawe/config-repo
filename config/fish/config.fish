# filename: fish.config

fish_vi_key_bindings
#source ~/.bashrc
#source ~/.aliases
#source ~/.fish_aliases
source ~/.config/fish/functions/aliases_simplified.fish
#source ~/.config/fish/aliases_simplified.fish

# thefuck - for suggesting command-line re-writes
thefuck --alias | source

# Known issues:
# 1. In MacOs, in a shell terminal (eg, Terminal or iTerm2), when using tmux,
#    with a fish terminal prompt customized to be multiple lines,
#    the prompt advances and reprints
#    (instead of properly reprinting in place, if reprinting at all)
#    a) when changing from vi insert mode to vi normal mode
#    b) when pasting text
#    c) maybe other scenarios
#       (see https://github.com/fish-shell/fish-shell/issues/3481)

