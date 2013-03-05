#!/bin/bash
############################
# .make.sh
# This script sets up dotfiles, including submodule initialization, and runs
# the Vundle installer. It creates symlinks from the home directory to any
# desired dotfiles (whose filenames begin with an '_', to be replaced by '.').
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files=`ls -d _*`                  # link all files in this repo starting with '_'
files=`echo $files|sed s/_//g`    # derive the basenames of each file/directory

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in $files; do
    if [ -e ~/.$file ]; then
        mv ~/.$file ~/dotfiles_old/
    fi
    ln -s $dir/_$file ~/.$file
done

# set up submodules
git submodule update --init

# run Vundle installer
vim -u bundles.vim +BundleInstall +q
