#!/usr/bin/env fish
# filename: fuck.fish
# purpose: Define a function (alias) `fuck` for the `thefuck` package.

# As instructed at https://github.com/nvbn/thefuck/wiki/Shell-aliases
# I've placed the output of `thefuck --alias`
# here in this file.  (It appears, by trial and error, that the name of this
# file must match the name of the alias/function below.

fuck () {
    TF_PYTHONIOENCODING=$PYTHONIOENCODING;
    export TF_SHELL=zsh;
    export TF_ALIAS=fuck;
    TF_SHELL_ALIASES=$(alias);
    export TF_SHELL_ALIASES;
    TF_HISTORY="$(fc -ln -10)";
    export TF_HISTORY;
    export PYTHONIOENCODING=utf-8;
    TF_CMD=$(
        thefuck THEFUCK_ARGUMENT_PLACEHOLDER $@
    ) && eval $TF_CMD;
    unset TF_HISTORY;
    export PYTHONIOENCODING=$TF_PYTHONIOENCODING;
    test -n "$TF_CMD" && print -s $TF_CMD
}
