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
Bundle 'fholgado/minibufexpl.vim'

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
" Statusline format stolen and commented from tpope's statusline here:
" http://got-ravings.blogspot.com/2008/08/vim-pr0n-making-statuslines-that-own.html
set laststatus=2
set statusline=[%n]\ %<%.99f\ %h%w%m%r     " buffer number, filename, flags
set statusline+=%{exists('*CapsLockStatusline')?CapsLockStatusline():''}
set statusline+=%y                         " filetype
set statusline+=%=                         " right-aligned status stuff next
set statusline+=%{fugitive#statusline()}   " git status
set statusline+=%-16(\ %l,%c-%v\ %)        " line#,col#-virtcol#
set statusline+=%P                         " percentage through file

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
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Don't let Vim-LaTeXSuite get in the way of my <C-j> mapping!
map <C-space> <Plug>IMAP_JumpForward

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

" Allow completion of snipMate snippets.
let g:acp_behaviorSnipmateLength = 1

" Preview extra information about omnicompletions.
set completeopt=menuone,longest,preview

" Ensure we're using the correct ctags.
let Tlist_Ctags_Cmd="/usr/local/bin/ctags"
