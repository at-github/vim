Vim Tarik's conf
================

Install
-------

To install this configuration, we need some steps :

One of the firsts steps it`s to clone this repo obviously
```
git clone https://github.com/tarik-atp/vim.git ~/.vim
```

After that move to this directory
```
cd ~/.vim
```

and laucnch script install.sh
```
./install.sh
```

###What does this script
* Create a relative symlinc of the .vimrc in your home
* Create a relative symlinc of the .nvimrc in your home for neovim
* Get vundle as submodule git
* Launch vim and install plugins with vundle method
    * The first time you launch this script you encour error, because the configuration file need plugin not already installed. Sorry about that.
