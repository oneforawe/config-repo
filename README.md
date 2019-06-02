# Configuration Files

This repository contains:

1. my personal customized user configuration files, and

2. an executable script to set up (link) the config files and install the
relevant packages.

The purpose of this repo is mostly for my own convenience, to make my working
environment consistent across different machines and to make it very easy to set
up a working environment on a new machine.  But for anyone who's curious, it's
also here to share config ideas and enable you to try out my setup.


## Installation

WARNING: This code risks deleting (over-writing) important files. It was made
for my convenience, not for the safety of your files.  (Safety will come later.)

1. Clone this repo to obtain a local copy the files:  
   `git clone https://github.com/oneforawe/config-files.git ~/.config-files`

2. Enter the repo and initialize and update (clone) the submodules contained in
this repo:  
   `cd ~/.config-files`  
   `git submodule init`  
   `git submodule update`

3. Run this command to over-write existing configuration files with links to the
config files in this repo and to install the necessary packages:  
   `bash ~/.config-files/setup/run-setup-full.sh`


## Terminology

Configuration files are often hidden files, by default not shown when viewing
the contents of directories so as to not clutter up one's view or confuse
regular users who are unaware of their purpose.  In Unix-like operating systems,
any file or folder starting with a period (a "dot") is treated as a hidden file
or hidden folder.

Configuration files go by many names.  Configuration files are also called
config-files, dot-files, initialization files, init-files, run-commands files,
rc-files, and possibly environment files, variable files, and so on.  A
configuration file for some hypothetical utility `util` may have a name such as
the following: `util`, `util.conf`, `.util`, `.util.conf`, `.utilrc`, etc.  An
associated config folder might have one of these same names or `util.d` or
`.util.d`, where the `d` presumably refers to "directory".

