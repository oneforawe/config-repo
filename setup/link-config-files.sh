#!/usr/bin/env bash
# filename: link-config-files.sh
# purpose: Automate installing/linking the user configuration files.

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


# SHELLS / TERMINALS:

# readline
ln -sFfh ~/.config-files/config/readline/inputrc ~/.inputrc

# bash
ln -sFfh ~/.config-files/config/bash/profile      ~/.profile
ln -sFfh ~/.config-files/config/bash/bash_profile ~/.bash_profile
ln -sFfh ~/.config-files/config/bash/bashrc       ~/.bashrc
ln -sFfh ~/.config-files/config/bash/bashrc_opt     ~/.bashrc_opt
ln -sFfh ~/.config-files/config/bash/bashrc_prompt  ~/.bashrc_prompt
ln -sFfh ~/.config-files/config/bash/bashrc_aliases ~/.bashrc_aliases
ln -sFfh ~/.config-files/config/bash/bashrc_etc     ~/.bashrc_etc

# zsh
ln -sFfh ~/.config-files/config/zsh/zprofile  ~/.zprofile
ln -sFfh ~/.config-files/config/zsh/zshrc     ~/.zshrc
ln -sFfh ~/.config-files/config/zsh/zshrc_omz ~/.zshrc_omz
ln -sFfh ~/.config-files/config/zsh/zshrc_opt ~/.zshrc_opt
ln -sFfh ~/.config-files/config/zsh/zshrc_prompt ~/.zshrc_prompt

# fish
ln -sFfh ~/.config-files/config/fish/config.fish    ~/.config/fish/config.fish
ln -sFfh ~/.config-files/config/fish/fish_variables ~/.config/fish/fish_variables
ln -sFfh ~/.config-files/config/fish/fishfile       ~/.config/fish/fishfile
ln -sFfh  ~/.config-files/config/fish/functions/fish_mode_prompt.fish \
    ~/.config/fish/functions/fish_mode_prompt.fish
ln -sFfh ~/.config-files/config/fish/functions/fish_prompt.fish \
    ~/.config/fish/functions/fish_prompt.fish
ln -sFfh ~/.config-files/config/fish/functions/aliases_simplified.fish \
    ~/.config/fish/functions/aliases_simplified.fish
ln -sFfh ~/.config-files/config/fish/functions/fuck.fish \
    ~/.config/fish/functions/fuck.fish


# tmux
ln -sFfh ~/.config-files/config/tmux/tmux.conf ~/.tmux.conf

# ssh (?)
#ln -sFfh .config-files/config/ssh/config .ssh/config


# EDITORS / DEV:

# vim
ln -sFfh ~/.config-files/config/vim/vimrc ~/.vimrc
ln -sFfh ~/.config-files/config/vim/vim.conf   ~/.vim
#ln -sFfh ~/.config-files/config/vim/vim.conf   $HOME/.vim

# emacs
#ln -sFfh ~/.config-files/config/emacs/emacs.conf ~/.emacs   (?)

# git
#ln -sFfh .config-files/config/gitconfig .gitconfig

# hg (mercurial)
#ln -sFfh .config-files/config/hgrc .hgrc

