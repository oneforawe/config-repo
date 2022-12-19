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

### New Steps

0. Ensure that either there is no `~/.gitconfig` file yet or that it at least
does not refer to non-existent files, to enable successful git-clone'ing.
Otherwise, you may see errors such as  
`fatal: remote-curl: fetch attempted without a local repo`  
or  
`fatal: --stdin requires a git repository`  
`fatal: fetch-pack: invalid index-pack output`

1. In a shell, clone this repo to obtain a local copy the files. Either use
https or ssh (written below in an abbreviated form that uses an ssh config):

   * https: `git clone https://github.com/oneforawe/config-repo.git ~/.config-repo`
   * ssh: `git clone github:oneforawe/config-repo.git ~/.config-repo`
   * If cloning fails due to a permission error where the ssh key is not being
   used, you may need to add the keys to the ssh-agent.  For example:  
   `eval "$(ssh-agent -s)" && ssh-add ~/.ssh/keys/github`
   * If cloning fails for, say, the emacs/org-mode submodule with, say, a fatal
   access error (`server certificate verification failed. CAfile: none CRLfile: none`),
   then you may need to use the cert installation solution here (along with the
   git configs of step 2 below):  
   <https://stackoverflow.com/questions/35821245/github-server-certificate-verification-failed>

2. Copy the git config file as a dot-file to the home directory and the local
.config-repo, and edit to remove the user info (for the home directory) and to
fill in the email address (for .config-repo).  Add the git config to the local
includes for .config-repo.  
  `cp ~/.config-repo/config/git/gitconfig ~/.gitconfig`  
  `cp ~/.config-repo/config/git/gitconfig ~/.config-repo/.gitconfig`  
  `git config --local include.path ../.gitconfig`

3. Run this command to over-write existing shell configuration files with links
to the config files in this repo and to install the necessary and desired
packages:  
  `bash ~/.config-repo/setup/remote-machine-setup/run-setup-shell-full.sh`

### Old Steps

(Previously, submodules were used; now, subtrees are used and no recursion is
necessary.)

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
