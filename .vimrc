" Vim 8.0
" Package manager: vim-plug

set number
set linebreak
set showbreak=+++
set textwidth=100
set showmatch
set visualbell
set hlsearch
set smartcase
set ignorecase
set incsearch
set autoindent
set smartindent
set smarttab
set expandtab
set paste
set statusline=2
set statusline=%f
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set ruler
set undolevels=1000
set backspace=indent,eol,start
set belloff=all
color desert
set updatetime=100  " for vim-gitgutter
syntax on

" External packages managed using vim-plug
call plug#begin()
Plug 'airblade/vim-gitgutter'
call plug#end()

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

" move among buffers with CTRL
map <C-J> :bnext<CR>
map <C-K> :bprev<CR>

" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
