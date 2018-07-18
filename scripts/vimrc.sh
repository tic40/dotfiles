#!/bin/bash
cd `dirname $0`

cp ../vim/vimrc ~/.vimrc
cp ../vim/functions.vim ~/.vim/
cp ../vim/main.vim ~/.vim/
cp ../vim/plugins.vim ~/.vim/

# install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
