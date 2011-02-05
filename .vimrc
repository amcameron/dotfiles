" Load Pathogen.
filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
au BufRead,BufNew *.pde set ft=arduino

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

" Turn off highlighting with <leader><space>
nnoremap <leader><space> :noh<cr>

" Remove trailing whitespace with <leader>W
nnoremap <leader>W :%s/\s\+$//g<cr>:let @/=''<cr>

" Rewrap the current paragraph, but leave the cursor where it is
nnoremap <leader>w gwip

" Select the text that was just pasted, yanked, changed, etc.
nnoremap <leader>v `[v`]

" Make NERDTree easier to access
nnoremap <F2> :NERDTreeToggle<cr>

" Make it easier to toggle paste mode - mappings are checked first,
" so this works only in Insert mode.  Which is perfect.
set pastetoggle=<F2>

" Make splitting and split navigation easier
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Tab settings: 4 spaces to a tab!  But don't expand them.
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab

" A little fun.  Requires figlet.
noremap <Up><Up><Down><Down><Left><Right><Left><Right>ba<CR> :botright !figlet "Vim    FTW"<CR>

" Break long lines automatically.
set tw=79
