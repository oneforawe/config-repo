# filename: fish_mode_prompt.fish

# The fish_mode_prompt function is (normally) prepended to the prompt
# But to customize where the (vi) mode indicator is located, one must
# re-define fish_mode_prompt to be empty and use
# fish_default_mode_prompt in fish_prompt.fish instead
function fish_mode_prompt --description "Displays (no longer) the current mode"
    # To re-use the mode indicator, use this function instead:
    # fish_default_mode_prompt
end

