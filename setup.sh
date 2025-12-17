#!/bin/bash
cd "$(dirname "$0")"

scripts_dir='scripts'
scripts=('gitconfig.sh' 'neovim.sh' 'sshconfig.sh' 'zsh.sh' 'ghostty.sh')

for ((i = 0; i < ${#scripts[@]}; i++)) {
  ${scripts_dir}/${scripts[i]}
}
