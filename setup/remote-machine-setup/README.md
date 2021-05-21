# For Remote Linux Machines

When connecting to a remote linux machine via ssh, it can be nice to apply some
configurations and install some software to have a more personalized experience,
both in functionality and aesthetics.

This simplifies the process.


## Installation

WARNING: This code risks deleting (over-writing) important files. It was made
for my convenience, not for the safety of your files.  (Safety will come later.)
Be sure to understand the code before running it, and save copies of important
relevant files that will be over-written if you want to go back to your original
settings.

1. In a shell, clone this whole repo to obtain a local copy the files:  
   `git clone https://github.com/oneforawe/config-files.git ~/.config-files`

2. Enter the repo and initialize and update (clone) the submodules contained in
this repo:  
   `cd ~/.config-files`  
   `git submodule init`  
   `git submodule update`

3. Run this command to over-write existing shell configuration files with links
to the config files in this repo and to install the necessary and desired
packages:  
   `bash ~/.config-files/setup/remote-machine-setup/run-setup-shell-full.sh`