
## have to treat fish differently than bash, zsh

Looks like `fish` doesn't follow symlinks to the config files, so they'll have
to be hard-copied into place instead.

* Fish doesn't follow symlinks  
   https://github.com/fish-shell/fish-shell/issues/2306
* Similar issue involving oh-my-fish  
   https://github.com/fish-shell/fish-shell/issues/4357

