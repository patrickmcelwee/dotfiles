#!/bin/bash

dir=~/.files
olddir=~/.files_old
files="bashrc bash_profile profile tmux.conf scripts"

echo "Creating $olddir for backup for existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

echo "Changing to the $dir directory"
cd $dir
echo "...done"

for file in $files; do
  if [ -f ~/.$file ] && [ ! -h ~/.$file ]; then
    echo "Moving ~/.$file from ~ to $olddir"
    mv ~/.$file $olddir
  fi
  echo "Creating symlink to $file in home directory."
  ln -s $dir/$file ~/.$file
done
