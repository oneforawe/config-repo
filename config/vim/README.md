
# vim

A great way to get started with the vim text editor is to use the vim tutor by
executing the following in a shell terminal and reading and following along with
the instructions provided:

`vimtutor`


## submodules

Some vim packages are added within this folder as submodules via other external
github repos. For example, the folder `vim.d/pack/external/start/vim-fold-cycle`
(which I had already downloaded via github cloning) was turned into the root of
a submodule by executing the following (in its containing folder):

`git submodule add https://github.com/arecarn/vim-fold-cycle.git vim-fold-cycle`


## reference

For the record, and for troubleshooting when things go wrong, I'll (try to) put
all of the submodule commands here.  (They normally won't need to be used.)

`git submodule add https://github.com/tpope/vim-scriptease vim-scriptease`
`git submodule add https://github.com/neitanod/vim-clevertab vim-clevertab`
`git submodule add https://github.com/arecarn/vim-fold-cycle.git vim-fold-cycle`
`git submodule add https://github.com/tpope/vim-surround vim-surround`
`git submodule add https://github.com/tpope/vim-unimpaired vim-unimpaired`

