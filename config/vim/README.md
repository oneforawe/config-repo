
# vim

A great way to get started with the vim text editor is to use the vim tutor by
executing the following in a shell terminal and reading and following along with
the instructions provided: `vimtutor`

For more in-depth learning, inside a session of vim, type `:help` or `:h` and
hit enter.

More advanced ideas: look at blog posts and youtube videos, like these posts:
* VIM AFTER 15 YEARS  
   https://statico.github.io/vim3.html
* Buffers, Windows, Tab Pages  
   https://romainl.github.io/the-patient-vimmer/2.html
* Why I love Vim: It’s the lesser-known features that make it so amazing  
   https://www.freecodecamp.org/news/learn-linux-vim-basic-features-19134461ab85/


## submodules

Some vim packages are added within this folder as submodules via other external
github repos. For example, the folder `vim.d/pack/external/start/vim-fold-cycle`
(which I had already downloaded via github cloning) was turned into the root of
a submodule by executing the following (in its containing folder):

`git submodule add https://github.com/arecarn/vim-fold-cycle.git vim-fold-cycle`


## reference

For the record, and for troubleshooting when things go wrong, I'll (try to) put
all of the submodule commands here.  (They normally won't need to be used.)

* `git submodule add https://github.com/tpope/vim-scriptease vim-scriptease`
* `git submodule add https://github.com/neitanod/vim-clevertab vim-clevertab`
* `git submodule add https://github.com/arecarn/vim-fold-cycle.git vim-fold-cycle`
* `git submodule add https://github.com/tpope/vim-surround vim-surround`
* `git submodule add https://github.com/tpope/vim-unimpaired vim-unimpaired`

