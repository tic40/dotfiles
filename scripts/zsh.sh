#!/bin/bash
cd "$(dirname "$0")"

# Install zplug if not already installed
if [ ! -d ~/.zplug ]; then
  echo "Installing zplug..."
  curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
else
  echo "zplug is already installed, skipping..."
fi

cp ../zsh/zshrc ~/.zshrc
