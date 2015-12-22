#!/usr/bin/env bash

# Create .vimrc symlink on home from folder .vim
ln -fs $HOME/.vim/.vimrc $HOME/.vimrc

ln -fs $HOME/.vim $HOME/.config/nvim
ln -fs $HOME/.vim/.vimrc $HOME/.vim/init.vim

# Init and pull submodules plugins
cd $HOME/.vim
git submodule init
git submodule update
cd -

vim +BundleInstall +BundleUpdate +BundleClean +qall
