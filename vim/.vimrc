"=============================================================================="
" Vim Configurations
" Author: Robb Currall <rlcurrall@castlebranch.com>
" Version: 19.12.10
"
" Some useful resources that I am utilizing to determine my configurations:
"       - https://dougblack.io/words/a-good-vimrc.html#spaces
"       - http://ctrlpvim.github.io/ctrlp.vim/#installation
"=============================================================================="

"=============================================================================="
" Initialization
"=============================================================================="
set nocompatible
filetype off
set encoding=UTF-8
set number
set autoread

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

" Plugins
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-fugitive'
Plugin 'chiel92/vim-autoformat'
Plugin 'cespare/vim-toml'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
Plugin 'vim-airline/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'dracula/vim', { 'name': 'dracula' }

Plugin 'ryanoasis/vim-devicons'

call vundle#end()
filetype plugin indent on

"=============================================================================="
" Appearance
"=============================================================================="
set colorcolumn=80,120
hi ColorColumn ctermbg=lightgrey guibg=lightgrey

colorscheme dracula

"=============================================================================="
" Key Remaps
"=============================================================================="
inoremap jk <esc>

"=============================================================================="
" Tabs and Spaces
"=============================================================================="
set tabstop=8
set softtabstop=0
set shiftwidth=4
set smarttab
set expandtab

"=============================================================================="
" Searching
"=============================================================================="
set incsearch
set hlsearch
nnoremap <leader><space> :nohlsearch<CR>

"=============================================================================="
" Folding
"=============================================================================="
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent

"=============================================================================="
" Fuzzy Search with Ripgrep
"=============================================================================="

" Use Ripgrep if available
if executable('rg')
    set grepprg=rg\ --color=never
    let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
    let g:ctrlp_use_caching = 0
endif

"=============================================================================="
" Tmux compatibility
"=============================================================================="
if $TERM =~ 'screen'
    nnoremap <C-A> <nop>
    nnoremap <Leader><C-A> <C-a>
endif

"=============================================================================="
" NERD Settings
"=============================================================================="

" Automatically Open when opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" Map Ctrl+n to toggle NERDTree
map <C-n> :NERDTreeToggle<CR>

" Close Vim if NERDTree is only window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Highlighting settings
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name

let g:syntastic_php_checkers = ['php', 'phpcbf', 'phpcs']
let g:syntastic_php_phpcs_args='--standard=PSR12 -n'
let g:syntastic_php_phpcfb_args='--standard=PSR12 -n'

