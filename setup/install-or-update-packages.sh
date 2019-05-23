#!/usr/bin/env bash
# filename: install-or-update-packages.sh
# purpose: Automate installing/updading packages in user config files.


#mkdir -pv $HOME/.config-files
#for file in $HOME/.config-files/config/* ; do
#  ln -sf $file $HOME/.config/$(basename $file)
#done

# FISH
# fisher
# https://github.com/jorgebucaran/fisher
#curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish

# ZSH
# setup zsh for this computer
#cd $HOME/config-files/config/zsh
#touch $(hostname).zsh
#git clone git://github.com/robbyrussell/oh-my-zsh.git

# TMUX
#cd $HOME/config-files/config/tmux
#git clone git://github.com/tmux-plugins/tmux-continuum.git
#git clone git://github.com/tmux-plugins/tmux-resurrect.git

# VIM
#git submodule add https://github.com/tpope/vim-scriptease.git   \
#    ~/.config/config/vim/vim/pack/external/opt/vim-scriptease
#git submodule add https://github.com/neitanod/vim-clevertab.git \
#    ~/.config/config/vim/vim/pack/external/start/vim-clevertab
#git submodule add https://github.com/arecarn/vim-fold-cycle.git \
#    ~/.config/config/vim/vim/pack/external/start/vim-fold-cycle
#git submodule add https://github.com/tpope/vim-surround.git     \
#    ~/.config/config/vim/vim/pack/external/start/vim-surround
#git submodule add https://github.com/tpope/vim-unimpaired.git   \
#    ~/.config/config/vim/vim/pack/external/start/vim-unimpaired

