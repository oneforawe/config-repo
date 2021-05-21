# Configuration Files

This repository contains:

1. my personal customized user configuration files, and

2. executable scripts to apply these configurations for shells, shell apps, the
Mac desktop, and Mac GUI apps.

The purpose of this repo is mostly for my own convenience, to make my working
environment consistent across different machines and to make it very easy to set
up a working environment on a new machine.  But for anyone who's curious, it's
also here to share config ideas and enable you to try out my setup.


## Installation

WARNING: This code risks deleting (over-writing) important files. It was made
for my convenience, not for the safety of your files.  (Safety will come later.)
Be sure to understand the code before running it, and save copies of important
relevant files that will be over-written if you want to go back to your original
settings.

1. In a shell, clone this repo to obtain a local copy the files:  
   `git clone https://github.com/oneforawe/config-files.git ~/.config-files`

2. For Mac systems, you can run the MacOS environment setup script:  
   `bash ~/.config-files/setup/run-setup-MacOS-env.sh`

3. Enter the repo and initialize and update (clone) the submodules contained in
this repo:  
   `cd ~/.config-files`  
   `git submodule init`  
   `git submodule update`

4. Run this command to over-write existing shell configuration files with links
to the config files in this repo and to install the necessary and desired
packages:  
   `bash ~/.config-files/setup/run-setup-shell-full.sh`

5. You may want to clean up (delete) extraneous config files, and you may have
to do some trouble-shooting once everything is set up.  For instance, I had to
use `brew link --overwrite python` after setting up on an old Mac system.


## Alternate

I created an alternate installation process for remote, unowned machines (as
opposed to my own personal machines).  Those setup instructions are
[here](https://github.com/oneforawe/config-files/tree/master/setup/remote-machine-setup).


## Development

Note to self: Don't forget to add submodules manually when installing them for the first
time:  
   `git submodule add https://url/submodule.git path/to/submodule`


## Terminology

Configuration files are often hidden files, by default not shown when viewing
the contents of directories so as to not clutter up one's view or confuse
regular users who are unaware of their purpose.  In Unix-like operating systems,
any file or folder starting with a period (a "dot") is treated as a hidden file
or hidden folder.  These hidden files are sometimes called "dot-files" or
"dotfiles" or even ".dotfiles", and so configuration files are often also
"dot-files".

Configuration files go by many names: config-files, dot-files, initialization
files, init-files, run-commands files, rc-files, and possibly environment files,
variable files, and so on.  A configuration file for some hypothetical utility
`util` may have a name such as the following: `util`, `util.config`,
`util.conf`, `util.cfg`, `.util`, `.util.conf`, `.utilrc`, etc.  An associated
config folder might have one of these same names or `util.d` or `.util.d`, where
the `d` presumably refers to "directory".

