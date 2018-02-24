#!/bin/bash

cp ../vim/.vimrc ~/
cp -R ../vim/.vim ~/

# install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
