#!/usr/bin/env bash
# filename: link-config-files.sh
# This script links/installs the configuration files.

cd $HOME
ln -sf .config-files/config/bash/profile      .profile
ln -sf .config-files/config/bash/bash_profile .bash_profile
ln -sf .config-files/config/bash/bashrc       .bashrc
ln -sf .config-files/config/bash/bashrc_prompt  .bashrc_prompt
ln -sf .config-files/config/bash/bashrc_aliases .bashrc_aliases
ln -sf .config-files/config/bash/bashrc_etc     .bashrc_etc
#ln -sf .config-files/configgitconfig .gitconfig
#ln -sf .config-files/config/hgrc .hgrc
ln -sf .config-files/config/tmux/tmux.conf .tmux.conf
#ln -sf .config-files/config/vim .vim
#ln -sf .config-files/config/vim/vimrc .vimrc
#ln -sf .config-files/config/zsh/zshrc .zshrc

#ln -sf .config-files/config/ssh/config .ssh/config

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
