# Create .vimrc symlink on home from folder .vim
ln -s $HOME/.vim/.vimrc $HOME

# Init and pull submodules plugins
git submodule init
git submodule update
