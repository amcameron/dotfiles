" {{{ Load Vundle.
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle manage Vundle.
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original github repos
Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'jpalardy/vim-slime'
Bundle 'msanders/snipmate.vim'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'bingaman/vim-sparkup'

" vim-scripts repos
Bundle 'AutoComplPop'
Bundle 'taglist.vim'
"Bundle 'VimPdb'
"Bundle 'Jinja'
Bundle 'LaTeX-Suite-aka-Vim-LaTeX'

" non-github repos
Bundle 'git://git.wincent.com/command-t.git'

filetype plugin indent on
" }}}
