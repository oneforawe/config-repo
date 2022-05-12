# local

## diff-so-fancy

Added `diff-so-fancy` with the following command in the repo:

`git submodule add https://github.com/so-fancy/diff-so-fancy.git config/local/diff-so-fancy`

(Had to choose a location in the PATH in the bash config files from which to
link to this package to make `diff-so-fancy` globally available.  Also created
an alias `difff` that uses `diff-so-fancy` with the usual `diff`.  Also set
`diff-so-fancy` to be used in `git diff`.)
