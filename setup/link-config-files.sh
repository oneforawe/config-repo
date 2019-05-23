#!/usr/bin/env bash
# filename: link-config-files.sh
# This script links/installs the configuration files.

# BASH
ln -sf ~/.config-files/config/bash/profile      ~/.profile
ln -sf ~/.config-files/config/bash/bash_profile ~/.bash_profile
ln -sf ~/.config-files/config/bash/bashrc       ~/.bashrc
ln -sf ~/.config-files/config/bash/bashrc_prompt  ~/.bashrc_prompt
ln -sf ~/.config-files/config/bash/bashrc_aliases ~/.bashrc_aliases
ln -sf ~/.config-files/config/bash/bashrc_etc     ~/.bashrc_etc

# ZSH
#ln -sf .config-files/config/zsh/zprofile .zprofile
#ln -sf .config-files/config/zsh/zshrc    .zshrc

# FISH
ln -sf ~/.config-files/config/fish/config.fish    ~/.config/fish/config.fish
ln -sf ~/.config-files/config/fish/fish_variables ~/.config/fish/fish_variables
ln -sf ~/.config-files/config/fish/fishfile       ~/.config/fish/fishfile

ln -sf ~/.config-files/config/functions/fish_mode_prompt.fish \
    ~/.config/fish/functions/fish_mode_prompt.fish
ln -sf ~/.config-files/config/functions/fish_prompt.fish \
    ~/.config/fish/functions/fish_prompt.fish

ln -sf ~/.config-files/config/functions/fish_mode_prompt.fish \
    ~/.config/fish/conf.d/functions/fish_mode_prompt.fish
ln -sf ~/.config-files/config/functions/fish_prompt.fish \
    ~/.config/fish/conf.d/functions/fish_prompt.fish

ln -sf ~/.config-files/config/functions/fish_mode_prompt.fish \
    ~/.config/fish/conf.d/fish_mode_prompt.fish
ln -sf ~/.config-files/config/functions/fish_prompt.fish \
    ~/.config/fish/conf.d/fish_prompt.fish
# fish_aliases, fish_aliases_simplified  don't need links; sourced directly

# VIM
#ln -sf .config-files/config/vim .vim
#ln -sf .config-files/config/vim/vimrc .vimrc

# TMUX
ln -sf ~/.config-files/config/tmux/tmux.conf ~/.tmux.conf
#ln -sf .config-files/config/gitconfig .gitconfig
#ln -sf .config-files/config/ssh/config .ssh/config
#ln -sf .config-files/config/hgrc .hgrc

#mkdir -p $HOME/.config
#for file in $HOME/config-files/config/* ; do
#  ln -sf $file $HOME/.config/$(basename $file)
#done

# setup zsh for this computer
#cd $HOME/config-files/config/zsh
#touch $(hostname).zsh
#git clone git://github.com/robbyrussell/oh-my-zsh.git

#cd $HOME/config-files/config/tmux
#git clone git://github.com/tmux-plugins/tmux-continuum.git
#git clone git://github.com/tmux-plugins/tmux-resurrect.git
