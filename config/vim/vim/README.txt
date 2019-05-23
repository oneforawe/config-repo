
Intro
-----

This file explains why some of these subfolders/subdirectories exist and give
some context.


Packages Notes
--------------

As far as I know, the most up-to-date solution for managing plugins and packages
is the vim-8 packages feature.

* packages feature (of vim-8)     --  implements features from pathogen, with
                                      additional support for optional plugins
* pathogen  (by Tim Pope: tpope)
* package managers
  - minpac   -- a modern alternative to vim-plug and vundle
  - vim-plug
  - vundle


Paths & Tutorial
----------------

I created the "pack/external" (like "pack/bundle") paths according to this tutorial:
http://vimcasts.org/episodes/packages/

Paths:
 "~/.vim/pack"                - for vim plugins and packages
 "~/.vim/pack/external"       - for plugins and packages maintained by others
 "~/.vim/pack/internal"       - for plugins and packages maintained by me
 "~/.vim/pack/external/start" - for plugins and packages that start when vim is opened
 "~/.vim/pack/external/opt"   - for plugins and packages are optionally available
                                (can use `:packadd` command to start them)

 The "pack" and "start" directory names are required, since they have special meaning
 for vim's packages feature.  Any intermediate directory names (such as "external" or
 "bundle") are arbitrary.  Things in "start" are automatically added to vim's run-
 time path (rtp) at startup.


Related Commands
----------------

* `:set rtp?`   - to see the run-time path
* `:help <plugin-name>`
                - to see the documentation
                  (eg, `:help surround` and `:help unimpaired`)
* `:helptags ALL`
                - automatically generate tags files in doc directories so that
                  the help-documentation becomes available via the `:help` command
* `con`         - to toggle line numbering (via vim-unimpaired)
* `cs({`        - to change surrounding brackets (via vim-surround)


Perhaps the colors folder should be incorporated into the "pack/external/" path somehow.
I think I was using vundle previously, but not sure what happened with that.


