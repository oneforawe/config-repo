# For Remote Linux Machines

When connecting via ssh to a remote GNU/Linux machine that you don't own (and so
others may be working on it as well), it can be nice to unobtrusively apply some
personal user configurations and install some software to have a more
personalized experience, both in functionality and aesthetics, while not
disrupting other users' experiences -- even if they're using the same account.

The files in this folder simplify that configuration/personalization process.


## Installation

WARNING: This code in its current state risks deleting (over-writing) important
files, although I made an attempt to add safety (for the first time) by
automating backup of pre-existing config files into a `~/.config-old-replaced`
folder so they are not simply over-written.  This code was made for my
convenience, not for the safety of your files.  (Perhaps more, better-tested
safety will come later.)  Be sure to understand the code before running it, and
save copies of important relevant files that may be over-written if you want to
go back to your original settings.

1. In a shell, clone this whole repo to obtain a local copy the files:  
   `git clone https://github.com/oneforawe/config-files.git ~/.config-files`

2. Enter the repo and initialize and update (clone) the submodules contained in
this repo:  
   `cd ~/.config-files`  
   `git submodule init`  
   `git submodule update`

3. Run this command to backup (or possibly over-write) existing shell
configuration files and add new links to the config files in this repo and to
install the necessary and desired packages:  
   `bash ~/.config-files/setup/remote-machine-setup/run-setup-shell-full.sh`
