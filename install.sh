#!/bin/bash
cd `dirname $0`

scripts_dir='scripts'
scripts=('gitconfig.sh' 'vimrc.sh' 'sshconfig.sh')

for ((i = 0; i < ${#scripts[@]}; i++)) {
  ${scripts_dir}/${scripts[i]}
}
