#!/bin/bash

scripts=('copyGitconfig.sh' 'copyVimrc.sh' 'copySSHConfig.sh' 'copyZshrc.sh')

for ((i = 0; i < ${#scripts[@]}; i++)) {
  ./${scripts[i]}
}
