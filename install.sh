#!/usr/bin/env bash

# Files to copy to $HOME
HOME_FILES=".vimrc .gitconfig .tmux.conf"

if [ "$1" == "--clean" ]; then
    for f in $HOME_FILES; do
        rm $HOME/$f
    done
    rm -f .ssh/authorized_keys
    rm -rf .vim
fi

for f in $HOME_FILES; do
    cp $f $HOME/$f
done

# Install SSH keys
if [ ! -d "$HOME/.ssh" ]; then
    mkdir $HOME/.ssh
    chmod 700 ~/.ssh
fi
if [ ! -f "$HOME/.ssh/authorized_keys" ]; then
    touch $HOME/.ssh/authorized_keys
    chmod 600 $HOME/.ssh/authorized_keys
fi
cat id_rsa.pub >> $HOME/.ssh/authorized_keys

# Install .vimrc
mkdir -p .vim
git clone http://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
vim -c 'PluginInstall' -c 'qa!'

