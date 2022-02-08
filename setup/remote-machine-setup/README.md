# For Remote Linux Machines

When connecting via ssh to a remote GNU/Linux machine that you don't own (and so
others may be working on it as well), it can be nice to unobtrusively apply some
personal user configurations and install some software to have a more
personalized experience, both in functionality and aesthetics, while not
disrupting other users' experiences -- even if they're using the same account.

...The effects of this installation could be less obtrusive... since it changes
the bash prompt, which is noticeable.  And if other users like to use zsh, this
changes the zsh prompt too.  (The other users might like the changes though.)

The files in this folder simplify the configuration/personalization process.


## Installation

WARNING: This code in its current state risks deleting (over-writing) important
files, although I made an attempt to add safety (for the first time) by
automating backup of pre-existing config files into a `~/.config-replaced`
folder so they are not simply over-written.  This code was made for my
convenience, not for the safety of your files.  (Perhaps more, better-tested
safety will come later.)  Be sure to understand the code before running it, and
save copies of important relevant files that may be over-written if you want to
go back to your original settings.

1. In a shell, clone this whole repo to obtain a local copy the files:  
   `git clone https://github.com/oneforawe/config-repo.git ~/.config-repo`

2. Enter the repo and initialize and update (clone) the submodules contained in
this repo:  
   `cd ~/.config-repo`  
   `git submodule init`  
   `git submodule update --recursive`

3. Run this command to backup (or possibly over-write) existing shell
configuration files and add new links to the config files in this repo and to
install the necessary and desired packages:  
   `bash ~/.config-repo/setup/remote-machine-setup/run-setup-shell-full.sh`

4. Copy the git config file to the home directory, as a dot-file, and edit to
fill in the email address (and possibly change the name) to be correct for the
given context.  
   `cp ~/.config-repo/config/git/gitconfig ~/.gitconfig`


## Default Shell

Dealing with the default shell:  
  To see users and properties including default login shell: `less /etc/passwd`  
  To see the current shell: `echo $0`  
  To see the available shells: `cat /etc/shells`  
  To see which `zsh` is called when executed: `which zsh`  
  To change the default login shell to zsh: `chsh --shell /bin/zsh` (or
  `sudo chsh --shell /bin/zsh "$USER"` if necessary)