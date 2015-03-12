#!/usr/bin/env bash

# Create .vimrc symlink on home from folder .vim
# TODO Add option backup
ln -fs $HOME/.vim/.vimrc $HOME/.vimrc
ln -fs $HOME/.vim/.vimrc $HOME/.nvimrc

# Init and pull submodules plugins
cd $HOME/.vim
git submodule init
git submodule update
cd -

vim +BundleInstall +BundleUpdate +BundleClean +qall
