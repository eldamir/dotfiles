""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" GENERAL
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
call plug#begin('~/.vim/plugged')

Plug 'rking/ag.vim'
Plug 'Yggdroot/indentLine'
Plug 'bling/vim-airline'
Plug 'seletskiy/vim-refugi'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'ludovicchabant/vim-gutentags'
Plug 'Valloric/MatchTagAlways'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'alvan/vim-closetag'
Plug 'benekastah/neomake'
Plug 'FredKSchott/CoVim'
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'

" tpope stuff
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-surround'

" Shougo stuff
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimproc.vim', {'do': 'make'}
Plug 'Shougo/unite-outline'
Plug 'Shougo/deoplete.nvim'

" Colors
Plug 'flazz/vim-colorschemes'
" Favourites are :
" * apprentice
" * railscasts


" All Plugins must be added before the following line
call plug#end()
filetype plugin indent on    " required

" Auto-reload .vimrc changes without restarting vim
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

if has('persistent_undo')      "check if your vim version supports it
  set undofile                 "turn on the feature
  set undodir=$HOME/.vim/undo  "directory where the undo files will be stored
endif

" Close preview window from omnicomplete, when leaving insert mode
" autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

set t_Co=256                   " Set 256 colors
set history=1000               " Set longer command history
let mapleader=","              " Map leader key
set lazyredraw                 " Don't block cursor while rendering

if has("nvim")
    set clipboard+=unnamedplus
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" EDITOR
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

colorscheme apprentice
set textwidth=80                           " Set 80 character gutter
set colorcolumn=+0                         " Set textwidth marker
syntax enable                              " enable syntax highlighting
let python_highlight_all = 1               " Python extra highlighting
set number                                 " show line numbers
set relativenumber                         " show relative line numbers
set foldmethod=indent                      " Folding
set foldlevelstart=6                       " Autofold on this level
set backspace=2                            " Delete anything with backspace
set sts=4                                  " Tab width
set ts=4
set shiftwidth=4
set autoindent                             " Simple indenting
set expandtab                              " expand tabs into spaces
set cursorline                             " Underline currenct line
set showmatch                              " Show matching brackets
set scrolloff=10                           " Scroll window when close to edges
set smartcase                              " Case insensitive unless capital letter
set ignorecase

" Highlight occurrences of word under cursor
" autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" PLUGINS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Deoplete
let g:deoplete#enable_at_startup = 1

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

let g:unite_source_rec_async_command = ['ag', '--follow', '--nocolor', '--nogroup', '-g', '']
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

" Make Ack and Ag not open first match automatically
cabbrev Ack Ack!
cabbrev Ag Ag!

" CtrlP
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|node_modules|\.sass-cache|bower_components|build|media|__pycache__)$',
  \ 'file': '\v\.(exe|so|dll|pyc)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" Airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 1
" let g:airline_theme='term' " Theme set by apprentice

" Auto-pairs
let g:AutoPairsMapCR = 0

" closetag
let g:closetag_filenames = "*.html,*.xhtml,*.phtml"

" Neomake
" make on write
autocmd! BufWritePost,BufEnter * Neomake
let g:neomake_python_enabled_makers = ['pep8', 'pylint']


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" KEYBINDINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""" Folding
" Open all folds under cursor
nnoremap <F8> zO
" Close all folds under cursor
nnoremap <F7> zc
" Open all folds
nnoremap <F6> zR
" Move between windows
nnoremap <C-H> <C-w>h
nnoremap <C-J> <C-w>j
nnoremap <C-K> <C-w>k
nnoremap <C-L> <C-w>l
" Move between buffers
nnoremap <leader>h :bprev<cr>
nnoremap <leader>l :bnext<cr>
" Destroy current buffer
nnoremap <leader>x :bd<cr>
" Destroy all buffers
nnoremap <leader>X :bufdo bd<cr>
" Quicksave
nnoremap <leader><leader> :wa<cr>
" Repeat macro
nnoremap ; @@
" Bigger status window
nmap <leader>gs :Gstatus<CR><C-w>20+
" Go to definition
nnoremap <leader>d :YcmCompleter

" FZF
nnoremap <C-P> :Files<CR>
nnoremap <C-O> :Tags<CR>
nnoremap <C-I> :Buffers<CR>

" Fuzzy outline
" nnoremap <C-U> :Unite outline<CR>

" Search word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" forward cycle deoplete menu
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" backward cycle deoplete menu
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

if has("nvim")
    :tnoremap <Esc> <C-\><C-n>
    :tnoremap <C-h> <C-\><C-n><C-w>h
    :tnoremap <C-j> <C-\><C-n><C-w>j
    :tnoremap <C-k> <C-\><C-n><C-w>k
    :tnoremap <C-l> <C-\><C-n><C-w>l
endif



function! SetupEnvironment()
  let l:path = expand('%:p')
  if l:path =~ '/home/ruben/workspace/v3'
    " Building
    nnoremap <F9> :Dispatch env/bin/py.test --nomigrations --lf %<CR>
    nnoremap <F10> :Dispatch env/bin/py.test --nomigrations --lf api v3 web<CR>
    nnoremap <F11> :Dispatch env/bin/python manage.py runserver<CR>
    nnoremap <S-F9> :Dispatch! env/bin/py.test --nomigrations --lf %<CR>
    nnoremap <S-F10> :Dispatch! env/bin/py.test --nomigrations --lf api v3 web<CR>
    nnoremap <S-F11> :Dispatch! env/bin/python manage.py runserver<CR>
  elseif l:path =~ '/home/user/projects'
    setlocal tabstop=4 shiftwidth=4 noexpandtab
  endif
endfunction
autocmd! BufReadPost,BufNewFile * call SetupEnvironment()
