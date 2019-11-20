"=============================================================================="
" Vim Configurations
" Author: Robb Currall <rlcurrall@castlebranch.com>
" Version: 19.11.18
"
" Some useful resources that I am utilizing to determine my configurations:
"       - https://dougblack.io/words/a-good-vimrc.html#spaces
"       - http://ctrlpvim.github.io/ctrlp.vim/#installation
"=============================================================================="

"=============================================================================="
" Appearance
"=============================================================================="
set colorcolumn=80,120
hi ColorColumn ctermbg=lightgrey guibg=lightgrey

" Color Scheme
augroup MyColors
    autocmd!
    autocmd ColorScheme * highlight ColorColumn ctermbg=grey guibg=grey
augroup END
colorscheme elflord

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

" Add CtrlP plugin - Reference: http://ctrlpvim.github.io/ctrlp.vim/#installation
set runtimepath^=~/.vim/bundle/ctrlp.vim

" Use Ripgrep if available
if executable('rg')
    set grepprg=rg\ --color=never
    let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
    let g:ctrlp_use_caching = 0
endif

