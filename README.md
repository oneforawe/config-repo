# Configuration Files

This repository contains:

1. my personal user configuration files, and

2. a script to setup the config files by creating links from the home folder to
the respective files in this repo.

The purpose of this repo is mostly for my own convenience when setting up my
working environments on new machines.  But for anyone who's curious, it's also
here to share config ideas and enable you to try out my setup.


## Installation

WARNING: This code risks deleting (over-writing) important files. It was made
for my convenience, not for the safety of your files.

1. Clone the repo to copy the files:  
   `git clone https://github.com/oneforawe/config-files.git ~/.config-files`

2. Run this command to over-write existing configuration files with links to the
config files in this repo:  
   `bash ~/.config-files/setup/link-config-files.sh`


## Terminology

Configuration files are often hidden files, by default not shown when viewing
the contents of directories so as to not clutter up one's view or confuse
regular users who are unaware of their purpose.  In Unix-like operating systems,
any file or folder starting with a period (a "dot") is treated as a hidden file
or hidden folder.

Configuration files are also called config-files, dot-files, initialization
files, init-files, run-commands files, rc-files, and possibly environment files,
variable files, and so on.

