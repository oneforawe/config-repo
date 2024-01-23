# Configuration Repo

This repository contains:

1. config: my personal customized computer user configuration files (mainly for
GNU/Linux and MacOS but also some configs and setup commands for Windows);

2. setup: executable scripts to apply these configurations for shells, shell
apps, the Mac desktop, and Mac GUI apps; and

3. notes/reference: notes on the repo (in the `notes` folder), notes on the
configs (in the `config` folder), and a reference for common commands.

The purpose of this repo is mostly for my own convenience, to make my working
environment consistent across different machines and to make it very easy to set
up a working environment on a new machine.  But for anyone who's curious, it's
also here to share config ideas and enable you to try out my setup.  See the
[Terminology](./#terminology) section below for explanation of terms.

## Two Versions

I created two versions of the installation process: the first one that's
designed primarily for my own usage on my own computers, and a second one that's
designed for remote and unowned machines with a greater emphasis on
safety/backup and a little more minimalism.  The instructions for the first
version are below, and the instructions for the second version can be found
[here](https://github.com/oneforawe/config-repo/tree/main/setup/remote-machine-setup).

## Installation

WARNING: This code risks deleting (over-writing) important files. It was made
for my convenience, not for the safety of your files.  (Safety will come later.)
Be sure to understand the code before running it, and save copies of important
relevant files that will be over-written if you want to go back to your original
settings.

### New Steps

0. Ensure that either there is no `~/.gitconfig` file yet or that it at least
does not refer to non-existent files, to enable successful git-clone'ing.
Otherwise, you may see errors such as  
`fatal: remote-curl: fetch attempted without a local repo`  
or  
`fatal: --stdin requires a git repository`  
`fatal: fetch-pack: invalid index-pack output`

   * Note: I also see these sorts of errors when the HEAD template file is a
     link (symlink, symbolic link) rather than a real file, where this file is
     specified in the `.gitconfig` by location with

    ```(text)
    [init]
      templateDir = ~/.config/git/template/
    ```

1. In a shell, clone this repo to obtain a local copy the files. Either use
https or ssh:

   * https:  
     `git clone https://github.com/oneforawe/config-repo.git ~/.config-repo`
   * ssh:  
     `git clone git@github.com:oneforawe/config-repo.git ~/.config-repo`  
     or (using abbreviations you can set up in your `.ssh/config` file)  
      `git clone github:oneforawe/config-repo.git ~/.config-repo`
   * If cloning fails due to a permission error where the ssh key is not being
   used, you may need to add the keys to the ssh-agent.  For example:  
   `eval "$(ssh-agent -s)" && ssh-add ~/.ssh/keys/github`
   * If cloning fails for, say, the emacs/org-mode submodule with, say, a fatal
   access error (`server certificate verification failed. CAfile: none CRLfile: none`),
   then you may need to use the cert installation solution here (along with the
   git configs of step 2 below):  
   <https://stackoverflow.com/questions/35821245/github-server-certificate-verification-failed>

2. Copy the git config file as a dot-file to the home directory, and edit to
remove the user info (or put appropriate default user info). This file
(`~/.gitconfig`) is the global gitconfig file. For me, the owner of this repo,
I can execute the additional commands below to modify the repo's local config
file in `~/.config-repo/.git/config` (editing to give my appropriate identity):  
  `cp ~/.config-repo/config/git/gitconfig ~/.gitconfig`  (and edit as desired)  
  In `~/.config-repo`:  
  `git config user.name "My Name"`  
  `git config user.email me@example.com`  
  (Alternatively, I could add a `.gitconfig` in the top level of the repo and
  add that file to the local `include.path`:  
  `cp ~/.config-repo/config/git/gitconfig ~/.config-repo/.gitconfig`  (and edit)  
  `git config --local include.path ../.gitconfig`  
  )  
  For Mac systems, you might have to change the location of the git template,
  using a more appropriate global location for Mac than your user `.config`
  folder, and using a hard copy rather than a link into the config files.  For
  instance:  
  `cp ~/.config-repo/config/git/template/HEAD /opt/homebrew/share/git-core/templates/HEAD`  
  And, accordingly, you'll have to alter the `~/.gitconfig` file,  
  changing `templateDir = ~/.config/git/template/`  
  to `templateDir = /opt/homebrew/share/git-core/templates/`.  
  Without that change, I got an error when attempting to git-clone:  
  `Cloning into 'repository'...`  
  `fatal: --stdin requires a git repository`  
  `fatal: fetch-pack: invalid index-pack output`

3. If intending on using emacs (with a config file that enables org-mode), prep
for org-mode usage (to eliminate start-up errors):  
  `cd ~/.config-repo/config/emacs/emacs.d/org-mode`  
  `make autoloads`

4. Run this command to over-write existing shell configuration files with links
to the config files in this repo and to install the necessary and desired
packages:  
  `bash ~/.config-repo/setup/run-setup-shell-full.sh`

5. For Mac systems, you can run the MacOS environment setup script:  
  `bash ~/.config-repo/setup/run-setup-MacOS-env.sh`  

### Older Steps

(Previously, submodules were used; now, subtrees are used and no recursion is
necessary.)

1. In a shell, clone this repo to obtain a local copy the files:  
  `git clone https://github.com/oneforawe/config-repo.git ~/.config-repo`

2. For Mac systems, you can run the MacOS environment setup script:  
  `bash ~/.config-repo/setup/run-setup-MacOS-env.sh`

3. Enter the repo and initialize and update (clone) the submodules contained in
this repo:  
  `cd ~/.config-repo`  
  `git submodule init`  
  `git submodule update --recursive`

4. Run this command to over-write existing shell configuration files with links
to the config files in this repo and to install the necessary and desired
packages:  
  `bash ~/.config-repo/setup/run-setup-shell-full.sh`

5. You may want to clean up (delete) extraneous config files, and you may have
to do some trouble-shooting once everything is set up.  For instance, I had to
use `brew link --overwrite python` after setting up on an old Mac system.

6. Copy the git config file to the home directory, as a dot-file, and edit to
fill in the email address.  
  `cp ~/.config-repo/config/git/gitconfig ~/.gitconfig`

## Development

Note to self: Don't forget to add submodules manually when installing them for
the first time:  
  `git submodule add https://url/submodule.git path/to/submodule`

Sometimes a submodule package may show up in git-status as "modified" (although
not showing any git-diff) and as "(untracked content)".  I've been able to fix
this situation by removing that whole package (with `rm -r package-name`) and
updating all submodules (with `git submodule update`).  Perhaps there's a better
way, but that works for me.  (Also consider `git submodule update --recursive`
and `git submodule update --init --recursive`.)

If changing something like the submodule url, see instructions such as
[these](https://stackoverflow.com/questions/913701/how-to-change-the-remote-repository-for-a-git-submodule).

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

## To Do

* Change handling of the git template HEAD file so it isn't a symbolic link but
  rather is a real file (or maybe a hard link).
