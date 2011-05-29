" {{{ Load Vundle.
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

" vim-scripts repos
Bundle 'AutoComplPop'

" non-github repos
Bundle 'git://git.wincent.com/command-t.git'

filetype plugin indent on
" }}}

set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
au BufRead,BufNew *.pde set ft=arduino

" Enable 256 color support.
set t_Co=256
" TODO: Set the terminal's color scheme to solarized.
let g:solarized_termcolors=16
set background=dark
colors solarized

syntax enable

" Make backspace behave sanely.
set backspace=indent,eol,start

" I don't use the comma, so it's better as the leader.
let mapleader = ","

" Some nifty settings.
set relativenumber
set incsearch
set showmatch
set hlsearch
set scrolloff=3
set showcmd
set wildmenu
set wildmode=longest:full
set visualbell
set ruler

" Always show a statusline.
set laststatus=2

" Turn off highlighting with <leader><space>
nnoremap <leader><space> :noh<cr>

" Remove trailing whitespace with <leader>W
nnoremap <leader>W :%s/\s\+$//g<cr>:let @/=''<cr>

" Rewrap the current paragraph, but leave the cursor where it is
nnoremap <leader>w gwip

" Select the text that was just pasted, yanked, changed, etc.
nnoremap <leader>v `[v`]

" Make NERDTree easier to access
"nnoremap <F2> :NERDTreeToggle<cr>

" Make it easier to toggle paste mode - mappings are checked first,
" so this works only in Insert mode.  Which is perfect.
set pastetoggle=<F2>

" Make splitting and split navigation easier
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Don't let Vim-LaTeXSuite get in the way of my <C-j> mapping!
map <C-space> <Plug>IMAP_JumpForward

" Tab settings: 4 spaces to a tab!
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" A little fun.  Requires figlet.
noremap <Up><Up><Down><Down><Left><Right><Left><Right>ba<CR> :botright !figlet "Vim    FTW"<CR>

" Break long lines automatically.
set tw=79
