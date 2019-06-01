#!/usr/bin/env bash
# filename: run-setup-step-1-link-files.sh
# purpose: Automate placing (linking) the user configuration files.

# TODO: Create function that doesn't just link but checks for pre-existing
#       files, saves them into a backup location such as
#       ~/.config-files-replaced/files-2019-05-22-h20-m34-s21/zshrc
#       and then creates the link (complaining if not succeeding, both in the
#       linking process and perhaps testing the link somehow).
# TODO: Get private info from user to put into private config files.
#       (How many files will be private? How important is it that they be
#        private? What's the best way to keep them private? Hm, maybe I could
#        have a template here to download, add info to, and place in an
#        encrypted location that other things read with interactive password
#        access. There could be slightly private, with simple password access,
#        and then super private, with more rigorous protection.)
#       EG: email address for .gitconfig (?)
#       mkdir -pv $HOME/.config-files-private/config/git/gitconfig
#       ln -sFfh ~/.config-files-private/config/git/gitconfig ~/.gitconfig


# Set variables
# ======================================================================
CONFIG_ROOT="$HOME"
CONFIG_FOLDER=".config-files"
CONFIG_LOCATION="$HOME/$CONFIG_FOLDER"

r=$CONFIG_ROOT
src=$CONFIG_LOCATION


# Link config (and reference) files
# ======================================================================
printf "Linking config (and reference) files.\n"


# REFERENCE:
ln -sFfh $src/reference/CommonCommands $r/.CommonCommands


# SHELLS / TERMINALS:

# readline
ln -sFfh $src/config/readline/inputrc $r/.inputrc

# bash
b1="$r/.config/bash"
b2="$src/config/bash"
mkdir -pv $b1
ln -sFfh $b2/bash_profile $r/.bash_profile
ln -sFfh $b2/bash_login   $r/.bash_login
ln -sFfh $b2/profile      $r/.profile
ln -sFfh $b2/bashrc       $r/.bashrc
ln -sFfh $b2/bashrc_opt           $b1/bashrc_opt
ln -sFfh $b2/bashrc_prompt        $b1/bashrc_prompt
ln -sFfh $b2/bashrc_aliases       $b1/bashrc_aliases
ln -sFfh $b2/bashrc_aliases_mac   $b1/bashrc_aliases_mac
ln -sFfh $b2/bashrc_aliases_linux $b1/bashrc_aliases_linux
ln -sFfh $b2/bashrc_etc           $b1/bashrc_etc
ln -sFfh $b2/bashrc_etc_mac       $b1/bashrc_etc_mac
#ln -sFfh $b2/bashrc_etc_linux     $b1/.bashrc_etc_linux
ln -sFfh $b2/bash_logout  ~/.bash_logout

# zsh
z1a="$r/.config/zsh"
z1b="$z1a/pack"
z2="$src/config/zsh"
mkdir -pv $z1a
mkdir -pv $z1b
ln -sFfh $z2/zprofile $r/.zprofile
ln -sFfh $z2/zshrc    $r/.zshrc
ln -sFfh $z2/zshrc_omz    $z1a/zshrc_omz
ln -sFfh $z2/zshrc_opt    $z1a/zshrc_opt
ln -sFfh $z2/zshrc_prompt $z1a/zshrc_prompt
# zsh packages / plugins
ln -sFfh $z2/oh-my-zsh    $z1a/oh-my-zsh
ln -sFfh $z2/pack/zsh-autosuggestions     $z1b/zsh-autosuggestions
ln -sFfh $z2/pack/zsh-syntax-highlighting $z1b/zsh-syntax-highlighting

# fish
f1a="$r/.config/fish"
f1b="$f1a/functions"
f2a="$src/config/fish"
f2b="$f2a/functions"
mkdir -pv $f1a
mkdir -pv $f1b
ln -sFfh $f2a/config.fish    $f1a/config.fish
ln -sFfh $f2a/fish_variables $f1a/fish_variables
ln -sFfh $f2a/fishfile       $f1a/fishfile
# fish (additional) functions
ln -sFfh $f2b/fish_mode_prompt.fish    $f1b/fish_mode_prompt.fish
ln -sFfh $f2b/fish_prompt.fish         $f1b/fish_prompt.fish
ln -sFfh $f2b/aliases_simplified.fish  $f1b/aliases_simplified.fish
ln -sFfh $f2b/fuck.fish                $f1b/fuck.fish

# pack  (packages common to the shells)
ln -sFfh $src/config/pack/thefuck $r/.config/thefuck

# tmux
ln -sFfh $src/config/tmux/tmux.conf $r/.tmux.conf

# ssh (?)
#ln -sFfh .config-files/config/ssh/config .ssh/config


# EDITORS / DEV:

# vim
ln -sFfh $src/config/vim/vimrc    $r/.vimrc
ln -sFfh $src/config/vim/vim.conf $r/.vim

# emacs
#ln -sFfh $src/config/emacs/emacs.conf ~/.emacs   (?)

# git
#ln -sFfh $src/config/gitconfig .gitconfig

# hg (mercurial)
#ln -sFfh $src/config/hgrc .hgrc

