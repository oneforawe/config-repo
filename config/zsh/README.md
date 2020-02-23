
# zsh

I use the z shell and oh-my-zsh.  See the general references below for some
introduction.

To get clarity on how zsh handles its config files, see the table in
reference 1.  Note that from `.zshrc` I source multiple files (including
`zshrc_omz` and `zshrc_opt`).


## reminder to self

When updating the submodule `oh-my-zsh`, after the update is pushed to master
and then pulled to another machine, it seems that I have to delete it
(`rm -r oh-my-zsh`) and then update the submodules  (`git submodule update`) to
properly checkout the updated submodule (`oh-my-zsh`).


## references

Regarding config files:

1. https://shreevatsa.wordpress.com/2008/03/30/zshbash-startup-files-loading-order-bashrc-zshrc-etc

General:

* If installed, execute `man zsh` for the manual page.
* [zsh on Wikipedia](https://en.wikipedia.org/wiki/Z_shell)
* [official zsh site](https://www.zsh.org)
* [zsh user's guide](http://zsh.sourceforge.net/Guide/zshguide.html)
* [Oh My ZSH!](https://ohmyz.sh)

