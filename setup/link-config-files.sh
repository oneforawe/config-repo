#!/usr/bin/env bash
# filename: link-config-files.sh
# purpose: Automate installing/linking the user configuration files.

# TODO: Create function that doesn't just link but checks for pre-existing
#       files, saves them into a backup location such as
#       ~/.config-files-replaced/files-2019-05-22-h20-m34-s21/zshrc
#       and then creates the link (complaining if not succeeding, both in the
#       linking process and perhaps testing the link somehow).


# SHELLS / TERMINALS:

# bash
ln -sf ~/.config-files/config/bash/profile      ~/.profile
ln -sf ~/.config-files/config/bash/bash_profile ~/.bash_profile
ln -sf ~/.config-files/config/bash/bashrc       ~/.bashrc
ln -sf ~/.config-files/config/bash/bashrc_prompt  ~/.bashrc_prompt
ln -sf ~/.config-files/config/bash/bashrc_aliases ~/.bashrc_aliases
ln -sf ~/.config-files/config/bash/bashrc_etc     ~/.bashrc_etc

# zsh
ln -sf ~/.config-files/config/zsh/zprofile ~/.zprofile
ln -sf ~/.config-files/config/zsh/zshrc    ~/.zshrc

# fish
ln -sf ~/.config-files/config/fish/config.fish    ~/.config/fish/config.fish
ln -sf ~/.config-files/config/fish/fish_variables ~/.config/fish/fish_variables
ln -sf ~/.config-files/config/fish/fishfile       ~/.config/fish/fishfile
ln -sf  ~/.config-files/config/fish/functions/fish_mode_prompt.fish \
    ~/.config/fish/functions/fish_mode_prompt.fish
ln -sf ~/.config-files/config/fish/functions/fish_prompt.fish \
    ~/.config/fish/functions/fish_prompt.fish
ln -sf ~/.config-files/config/fish/functions/aliases_simplified.fish \
    ~/.config/fish/functions/aliases_simplified.fish

# tmux
ln -sf ~/.config-files/config/tmux/tmux.conf ~/.tmux.conf

# ssh (?)
#ln -sf .config-files/config/ssh/config .ssh/config


# EDITORS / DEV:

# vim
ln -sf ~/.config-files/config/vim/vimrc ~/.vimrc
ln -sf ~/.config-files/config/vim/vim ~/.vim

# emacs
#ln -sf ~/.config-files/config/emacs/emacs.conf ~/.emacs   (?)

# git
#ln -sf .config-files/config/gitconfig .gitconfig

# hg (mercurial)
#ln -sf .config-files/config/hgrc .hgrc

