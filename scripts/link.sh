#!/bin/bash

IGNORE=(Readme.md scripts config)
DIR="$( cd -P "$( dirname "../${BASH_SOURCE[0]}" )" && pwd )/"


ignored() {
  for e in "${@:2}"; do [[ "$e" == "$1" ]] && return 0; done
  return 1
}

for file in $(ls ${DIR}); do
  ignored $file "${IGNORE[@]}"

  if [ $? -eq 0 ]; then
    continue
  fi
  echo -e "\033[0;34mCreating Symlink:\033[0m\n$DIR$file => ~/.$file"
  rm -r $HOME/.$file &> /dev/null
  ln -s $DIR$file ~/.$file
done

# Creating default folders
echo -e "\033[0;34mCreating Default Folders\033[0m\n~/projects\n~/code\n~/test_cases\n~/gocode\n"
mkdir $HOME/{projects,code,test_cases,gocode} &> /dev/null
