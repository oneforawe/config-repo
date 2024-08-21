# zsh

I use the z shell and oh-my-zsh.  See the general references below for some
introduction.

To get clarity on how zsh handles its config files, see the table in
reference 1.  Note that from `.zshrc` I source multiple files (including
`zshrc_omz` and `zshrc_opt`).

## installation

* [oh-my-zsh](https://ohmyz.sh/)
  * If needed, delete old obsolete folders/links `~/.config/zsh/oh-my-zsh/` and
    `~/.config/zsh/pack/`.  
    `rm -r ~/.config/zsh/oh-my-zsh`  
    `rm -r ~/.config/zsh/pack`
  * Use the curl command provided at the main page or github page, EG:
    `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
  * Delete the auto-generated zshrc file and edit the moved original file to
    keep it (where the original file should have contents that list the two
    plugins below along with git).  
    `rm ~/.zshrc`  
    `mv ~/.zshrc.pre-oh-my-zsh ~/.zshrc`
* plugin: zsh-autosuggestions  
  `git clone https://github.com/zsh-users/zsh-autosuggestions ~/.config/zsh/oh-my-zsh/custom/plugins/zsh-autosuggestions`
* plugin: zsh-syntax-highlighting  
  `git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.config/zsh/oh-my-zsh/custom/plugins/zsh-syntax-highlighting`

## submodules (obsolete)

When updating the submodule `oh-my-zsh`, after the update is pushed to master
and then pulled to another machine, it seems that I have to delete it
(`rm -r oh-my-zsh`) and then update the submodules  (`git submodule update`) to
properly checkout the updated submodule (`oh-my-zsh`).

## references

Regarding config files:

1. <https://shreevatsa.wordpress.com/2008/03/30/zshbash-startup-files-loading-order-bashrc-zshrc-etc>

General:

* If installed, execute `man zsh` for the manual page.
* [zsh on Wikipedia](https://en.wikipedia.org/wiki/Z_shell)
* [official zsh site](https://www.zsh.org)
* [zsh user's guide](http://zsh.sourceforge.net/Guide/zshguide.html)
* [Oh My ZSH!](https://ohmyz.sh)
