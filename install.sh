#!/usr/bin/env bash

# Create .vimrc symlink on home from folder .vim
if [[ ! -L $HOME/.vimrc ]]; then
    ln -fs $HOME/.vim/.vimrc $HOME/.vimrc
fi

# Neovim, symlink vim folder and .vimrc
if [[ ! -L $HOME/.config/nvim ]]; then
    ln -fs $HOME/.vim $HOME/.config/nvim
fi

if [[ ! -L $HOME/.vim/init.vim ]]; then
    ln -fs $HOME/.vim/.vimrc $HOME/.vim/init.vim
fi

# Init and pull submodules plugins
cd $HOME/.vim
git submodule init
git submodule update
cd -

# Install, update and clean vim plugin
vim +BundleInstall +qa
vim +BundleUpdate +BundleClean +qall

./bundle/YouCompleteMe/install.py --clang-completer
