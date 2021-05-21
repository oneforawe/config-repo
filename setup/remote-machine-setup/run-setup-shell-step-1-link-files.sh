#!/usr/bin/env bash
# filename: run-setup-shell-step-1-link-files.sh
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


# Set variables and alias
# ======================================================================
CONFIG_ROOT="$HOME"
CONFIG_FOLDER=".config-files"
CONFIG_LOCATION="$HOME/$CONFIG_FOLDER"

r=$CONFIG_ROOT
src=$CONFIG_LOCATION

THE_DATE_IN_MS="$(date +%s%3N)"
THE_DATE="${THE_DATE_IN_MS::-3}"
MILLISEC="$(echo $THE_DATE_IN_MS | tail -c 4)"
TIMESTAMP="${THE_DATE_IN_MS}_$(date -d @$THE_DATE +Date_%Y-%m-%d_Time_%H_%M_%S).$MILLISEC"

COPY_LOCATION="$CONFIG_ROOT/.config-old-replaced/copy_$TIMESTAMP"

cpy=$COPY_LOCATION

# For GNU/Linux tools (GNU)
if [[ `uname -s` = "Linux" ]] ; then
    function ln_s () { ln -sf $@ ; }
fi


# Link config (and reference) files
# ======================================================================
echo "Linking config (and reference) files."


# REFERENCE:
##ln_s $src/reference/CommonCommands $r/.CommonCommands


# SHELLS / TERMINALS:

# readline
echo "test with cp rather than mv"
if [[ -f $r/.inputrc ]] ; then
  #mv $r/.inputrc ${cpy}/
  cp $r/.inputrc ${cpy}/
  echo "cp $r/.inputrc ${cpy}/"
fi
###ln_s $src/config/readline/inputrc $r/.inputrc

# bash
b1="$r/.config/bash"
b2="$src/config/bash"
mkdir -pv $b1
filelist_bash=".profile .bashrc .bash_profile .bash_login .bash_logout .dir_colors"
echo "test with cp rather than mv"
for file in ${filelist_bash} ; do
  if [[ -f $r/$file ]] ; then
    #mv $r/$file ${cpy}/
    cp $r/$file ${cpy}/
    echo "cp $r/$file ${cpy}/"
  fi
done
###ln_s $b2/bash_profile $r/.bash_profile
###ln_s $b2/bash_login   $r/.bash_login
###ln_s $b2/profile      $r/.profile
###ln_s $b2/bashrc       $r/.bashrc
###ln_s $b2/bashrc_opt           $b1/bashrc_opt
###ln_s $b2/bashrc_prompt        $b1/bashrc_prompt
###ln_s $b2/bashrc_aliases       $b1/bashrc_aliases
###ln_s $b2/bashrc_aliases_lsGNU $b1/bashrc_aliases_lsGNU
###ln_s $b2/bashrc_aliases_lsBSD $b1/bashrc_aliases_lsBSD
###ln_s $b2/bashrc_aliases_mac   $b1/bashrc_aliases_mac
###ln_s $b2/bashrc_aliases_linux $b1/bashrc_aliases_linux
###ln_s $b2/bashrc_etc           $b1/bashrc_etc
###ln_s $b2/bashrc_etc_mac       $b1/bashrc_etc_mac
#ln_s $b2/bashrc_etc_linux     $b1/.bashrc_etc_linux
###ln_s $b2/bash_logout  $r/.bash_logout
###ln_s $b2/dir_colors   $r/.dir_colors

# zsh
z1a="$r/.config/zsh"
z1b="$z1a/pack"
z2="$src/config/zsh"
mkdir -pv $z1a
mkdir -pv $z1b
filelist_zsh=".zprofile .zshrc"
echo "test with cp rather than mv"
for file in ${filelist_zsh} ; do
  if [[ -f $r/$file ]] ; then
    #mv $r/$file ${cpy}/
    cp $r/$file ${cpy}/
    echo "cp $r/$file ${cpy}/"
  fi
done
###ln_s $z2/zprofile $r/.zprofile
###ln_s $z2/zshrc    $r/.zshrc
###ln_s $z2/zshrc_omz    $z1a/zshrc_omz
###ln_s $z2/zshrc_opt    $z1a/zshrc_opt
###ln_s $z2/zshrc_prompt $z1a/zshrc_prompt
# zsh packages / plugins
###rm -r $z1a/oh-my-zsh
###rm -r $z1b/zsh-autosuggestions
###rm -r $z1b/zsh-syntax-highlighting
###ln_s $z2/oh-my-zsh $z1a/
###ln_s $z2/pack/zsh-autosuggestions     $z1b/
###ln_s $z2/pack/zsh-syntax-highlighting $z1b/

# tmux
if [[ -f $r/.tmux.conf ]] ; then
  #mv $r/.tmux.conf ${cpy}/
  cp $r/.tmux.conf ${cpy}/
  echo "cp $r/.tmux.conf ${cpy}/"
fi
###ln_s $src/config/tmux/tmux.conf $r/.tmux.conf

# ssh (?)
#ln_s .config-files/config/ssh/config .ssh/config


# EDITORS / DEV:

# vim
echo "test with cp rather than mv"
if [[ -d $r/.vim ]] ; then
  #mv $r/.vim  ${cpy}/
  cp -a $r/.vim  ${cpy}/
  echo "cp -a $r/.vim  ${cpy}/"
fi
if [[ -f $r/.vimrc ]] ; then
  #mv $r/.vimrc  ${cpy}/
  cp $r/.vimrc  ${cpy}/
  echo "cp $r/.vimrc  ${cpy}/"
fi
###ln_s $src/config/vim/vimrc $r/.vimrc
###ln_s $src/config/vim/vim.d $r/.vim

# git
#ln_s $src/config/gitconfig .gitconfig