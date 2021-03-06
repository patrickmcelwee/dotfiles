#!/bin/bash

dir=~/dotfiles
olddir=~/dotfiles_old
files="bashrc bash_profile profile tmux.conf gitconfig vimrc inputrc editrc eslintrc.js"
linkeddirs="scripts vim tmux"

echo "Creating $olddir for backup for existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

echo "Changing to the $dir directory"
cd $dir
echo "...done"

for file in $files; do
  if [ -h ~/.$file ]; then
    echo "Removing existing symlink ~/.$file"
    rm ~/.$file
  fi
  if [ -f ~/.$file ]; then
    echo "Moving ~/.$file from ~ to $olddir"
    mv ~/.$file $olddir
  fi
  echo "Creating symlink to $file in home directory."
  ln -s $dir/$file ~/.$file
done

for linkeddir in $linkeddirs; do
  if [ -h ~/."$linkeddir" ]; then
    echo "Removing symlink ~/.$linkeddir"
    rm ~/."$linkeddir"
  fi
  if [ -d ~/."$linkeddir" ]; then
    FILES=~/."$linkeddir"/*
    mkdir -p $olddir/.$linkeddir
    for file in $FILES; do
      if [ -f $file ]; then
        echo "Moving $file from ~ to $olddir/.$linkeddir/"
        mv $file $olddir/."$linkeddir"
      fi
    done
    echo "Removing directory ~/.$linkeddir"
    rm -r ~/."$linkeddir"
  fi
  echo "Creating symlink to directory $linkeddir in home directory"
  ln -s $dir/$linkeddir ~/.$linkeddir
done

echo "Setting up Vundle for vim..."
[ -d ~/.vim/bundle ] || mkdir ~/.vim/bundle
if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
  echo "...cloning down Vundle"
  git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
echo "...done"

echo "Setting up ~/.vim_backups"
[ -d ~/.vim_backups ] || mkdir ~/.vim_backups
