source ~/.vim/bundles.vim

" With minibufexpl, jedi-vim should use buffers, not tabs.
let g:jedi#use_tabs_not_buffers = 0

" If a virtualenv is active, add its site-packages to vim path.
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
au BufRead,BufNew *.pde set ft=arduino

" Enable 256 color support.
syntax enable
set t_Co=256
set background=dark
colors solarized


" Make backspace behave sanely.
set backspace=indent,eol,start

" I don't use the comma, so it's better as the leader.
let mapleader = ","

" Some nifty settings.
set number
set relativenumber
set numberwidth=1
set incsearch
set showmatch
set hlsearch
set scrolloff=3
set showcmd
set wildmenu
set wildmode=longest:full
set visualbell
set ruler
set modeline

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

" Use Tabular to align text.
if exists(":Tabularize")
    nnoremap <leader>amp :Tabular /&<cr>
    vnoremap <leader>amp :Tabular /&<cr>
endif

" j/k > +/-, so make the latter two more useful.
map + <C-W>+
map - <C-W>-

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

" Tab settings: 4 spaces to a tab!
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" A little fun.  Requires figlet.
noremap <Up><Up><Down><Down><Left><Right><Left><Right>ba<CR> :botright !figlet "Vim    FTW"<CR>

" Break long lines automatically.
set tw=79

" Preview extra information about omnicompletions.
set completeopt=menuone,longest,preview

" Ensure we're using the correct ctags.
let Tlist_Ctags_Cmd="/usr/local/bin/ctags"

" Extra whitespace highlighting
highlight ExtraWhitespace ctermbg=red guibg=red
au ColorScheme * highlight ExtraWhitespace guibg=red
au BufEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/

" Check for formatting and programming errors in Python files.
nnoremap <leader>8 call Flake8()

" Move list elements around more easily.
nnoremap <c-m>h :SidewaysLeft<cr>
nnoremap <c-m>l :SidewaysRight<cr>

" Use tmux instead of screen for REPL sessions.
let g:slime_target = "tmux"

" vim:fdm=marker
