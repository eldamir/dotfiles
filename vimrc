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
Plug 'Valloric/YouCompleteMe', {'do': './install.py'}
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" tpope stuff
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-surround'

" Shougo stuff
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimproc.vim', {'do': 'make'}
Plug 'Shougo/unite-outline'
" These seem inferior to YCM and Ultisnips,
" event though they are optimized for neovim :(
" Plug 'Shougo/deoplete.nvim'
" Plug 'Shougo/neosnippet'
" Plug 'Shougo/neosnippet-snippets'

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
set foldlevelstart=99                      " Autofold on this level
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

let g:UltiSnipsExpandTrigger="<c-j>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
endif

let g:unite_source_rec_async_command = ['ag', '--follow', '--nocolor', '--nogroup', '-g', '']
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

" Make Ack and Ag not open first match automatically
cabbrev Ack Ack!
cabbrev Ag Ag!

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
autocmd! BufWritePost * Neomake
let g:neomake_python_enabled_makers = ['pylint']

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Commands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! ClearSearch let @/ = ""
command! ToggleSearchHighlight set hlsearch!


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" KEYBINDINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Map ESC to jk
imap jk <Esc>
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

" YouCompleteMe
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
map <leader>d  :YcmCompleter GetDoc<CR>
map <leader>u  :YcmCompleter GoToReferences<CR>

" Jump out of terminal window to another window
if has("nvim")
    :tnoremap <Esc> <C-\><C-n>
    :tnoremap <C-h> <C-\><C-n><C-w>h
    :tnoremap <C-j> <C-\><C-n><C-w>j
    :tnoremap <C-k> <C-\><C-n><C-w>k
    :tnoremap <C-l> <C-\><C-n><C-w>l
endif
