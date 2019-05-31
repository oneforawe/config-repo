# filename: fish_prompt.fish

# TODO: Instead of using `date` at each printing/re-printing/refreshing of the
#       prompt, save the date/time upon completion of a command execution, and
#       print *that* date for each subsequent printing/re-printing/refreshing of
#       the prompt.

function fish_prompt --description 'Write out the prompt'

    set stat $status

    if not set -q __fish_prompt_normal
        set -g __fish_prompt_normal (set_color normal)
    end

    if not set -q __fish_color_blue
        set -g __fish_color_blue (set_color -o blue)
    end

    # Set the color for the status depending on the value
    set __fish_color_status (set_color -o green)
    if test $stat -gt 0
        set __fish_color_status (set_color -o red)
    end

    # Get IP (copying the code used in .fancy_prompt for bash) (for Mac)
    set THE_IP (echo (ifconfig|grep broadcast|awk '{print $2}'))
    if test -z $THE_IP
        set THE_IP "IP_MISSING"
    end

    # Define colors for use in the prompt (locally defined)
    #set -l PROMPT_COLOR_BLOCK (set_color --background 663300) # color?
    #set -l PROMPT_COLOR_BLOCK (set_color --background E38217) # orange
    set -l PROMPT_TIME_STAMP_COLOR (set_color c4abf5) # light purple ("__fish_color_blue")
    set -l PROMPT_USER_HOST_COLOR (set_color 89c3ca)  # light blue
    set -l PROMPT_PWD_COLOR (set_color 89F297)        # light green

    # Define an alternate version of fish_default_mode_prompt
    function fish_alt_mode_prompt --description "Display the mode for the prompt (in an alt style)"
        # Do nothing if not in vi mode
        if test "$fish_key_bindings" = "fish_vi_key_bindings"
            or test "$fish_key_bindings" = "fish_hybrid_key_bindings"
            switch $fish_bind_mode
                case default
                    set_color --bold --background 9e1b14 white # dark red
                    echo 'N'
                case insert
                    set_color --bold --background 1c6b2f white # dark green
                    echo 'I'
                case replace_one
                    set_color --bold --background green white
                    echo 'R'
                case visual
                    set_color --bold --background magenta white
                    echo 'V'
            end
            set_color normal
            echo -n ""
        end
    end

    switch "$USER"

        case root toor

            if not set -q __fish_prompt_cwd
                if set -q fish_color_cwd_root
                    set -g __fish_prompt_cwd (set_color $fish_color_cwd_root)
                else
                    set -g __fish_prompt_cwd (set_color $fish_color_cwd)
                end
            end

            printf '%s @ %s  %s%s%s# ' $USER (prompt_hostname) "$__fish_prompt_cwd" (prompt_pwd) "$__fish_prompt_normal"

        case '*'

            if not set -q __fish_prompt_cwd
                set -g __fish_prompt_cwd (set_color $fish_color_cwd)
            end

            # note: can't put a dash at the beginning of the display string
            printf '\f\r  \u250C %s%s[%s] %s%s @ %s [%s]%s %s(%s)%s\f\r  \u2502 %s%s%s\f\r%s%s \u2514 ' \
                #                1 2  3   4 5    6   7  8  9  10 11            12 13 14  15 16
                #"$PROMPT_COLOR_BLOCK" " " (set_color normal) \
                "$PROMPT_TIME_STAMP_COLOR" (set_color --bold) (date "+%Y %b %d %a %H:%M:%S") \
                # 1                        2                  3
                "$PROMPT_USER_HOST_COLOR" "$USER" (uname -n) "$THE_IP" (set_color normal) \
                # 4                        5      6          7         8
                "$__fish_color_status" "$stat" "$__fish_prompt_normal" \
                # 9                    10      11
                #"$PROMPT_COLOR_BLOCK" " " (set_color normal) \
                "$PROMPT_PWD_COLOR" "$PWD" (set_color normal) \
                # 12                13     14
                (fish_alt_mode_prompt)
                # 15  (16?)
                # not using "$__fish_prompt_cwd" for "$PWD"
    end
end

