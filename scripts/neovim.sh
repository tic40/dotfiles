#!/bin/bash
cd `dirname $0`

mkdir -p ~/.config/nvim
cp ../neovim/init.vim ~/.config/nvim/
cp ../neovim/config.vim ~/.config/nvim/
cp ../neovim/plugins.vim ~/.config/nvim/

# install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'