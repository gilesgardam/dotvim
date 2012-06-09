dotvim
======

Installation

    git clone git://github.com/gilesgardam/dotvim.git ~/.vim

Create a symlink

    ln -s ~/.vim/vimrc ~/.vimrc

Where possible, I've installed plugins as git submodules.

    cd ~/.vim
    git submodule update --init

For the backup and swap files, you need to either

    mkdkir ~/tmp

or change the vimrc to taste.

Abbreviations go in plugin/abbreviations.vim.
Any tips or tricks you want to remember go in notes.txt.
Settings local to the particular machine go in plugin/local.vim.
