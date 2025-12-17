#!/bin/bash
cd "$(dirname "$0")"

mkdir -p ~/.config/nvim
cp -R ../neovim/* ~/.config/nvim/
