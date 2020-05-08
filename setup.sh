#!/bin/bash
############################
# .make.sh
# This script sets up dotfiles, including submodule initialization, and runs
# the Vundle installer. It creates symlinks from the home directory to any
# desired dotfiles (whose filenames begin with an '_', to be replaced by '.').
############################

# unstow all configurations by default
# otherwise, unstow just the configurations provided as arguments
stow -v ${@:-*/}

# set up submodules
git submodule update --init

# run Vundle installer
vim -u vim/.vim/bundles.vim +BundleInstall +q
