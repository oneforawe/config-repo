
# vim

The vim text editor is a very versatile and popular editor.  Enter `man vim` in
the shell for info on usage.  For instance, to edit a file, such as
`~/file.txt`, enter the program name (vim) and the path to the file to be edited
in the shell, `vim ~/file.txt`, or navigate to the location of the file (in this
case your home directory `~`) and execute using just the file name:
`vim file.txt`.

To learn more about vim, you can enter `vim` on its own in the shell, without
referring to a file, and vim provides instruction on how to exit vim or get
help.  Early in the help file, a great recommendation is made: when getting
started you can use the vim tutor by entering `vimtutor` in the shell and then
following the instructions.

And for more info from the vim website itself, see  
  https://www.vim.org

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
all of the submodule commands here.  They normally won't need to be used.  If
using them, be sure to navigate to the correct folder before executing, or give
the full path to the submodule at the end of the command.

* `git submodule add https://github.com/tpope/vim-scriptease vim-scriptease`
* `git submodule add https://github.com/neitanod/vim-clevertab vim-clevertab`
* `git submodule add https://github.com/arecarn/vim-fold-cycle.git vim-fold-cycle`
* `git submodule add https://github.com/tpope/vim-surround vim-surround`
* `git submodule add https://github.com/tpope/vim-unimpaired vim-unimpaired`
* `git submodule add https://github.com/sheerun/vim-polyglot.git vim-polyglot`
* `git submodule add https://github.com/dense-analysis/ale.git ale`

Also, I don't think I've used this command, but I might want to keep it in mind:

`git submodule update --init --recursive`

Might want to look at a more up-to-date reference, or see this blog post:  
  `https://github.blog/2016-02-01-working-with-submodules/`

