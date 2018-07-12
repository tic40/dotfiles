#!/bin/bash
cd `dirname $0`

curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

cp ../zsh/zshrc ~/.zshrc
