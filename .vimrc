" Vim 8.0
" Package manager: vim-plug

" === Basic settings ===
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
set copyindent
color desert
syntax on


" === Third-party packages and settings ===

" External packages managed using vim-plug
call plug#begin()
Plug 'airblade/vim-gitgutter'
call plug#end()

" for vim-gitgutter
set updatetime=100


" === Misc. aesthetics ===

" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Color column 80
" To turnoff, set cc=
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

" === Shortcuts and other key mappings ===

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

" <Ctrl-c> to copy from clipboard
vnoremap <C-c> :w !pbcopy<CR><CR>

" move among buffers with CTRL
map <C-J> :bnext<CR>
map <C-K> :bprev<CR>

" Remap command keys

command! W :w
command! Q :q


" === Functions ===

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
" Trim whitespace upon writing file to disk
autocmd BufWritePre * :call TrimWhitespace()

" Copy paths current file to system clipboard
fun! CopyRelPath()
    let @+ = expand("%")
endfun
fun! CopyAbsPath()
    let @+ = expand("%:p")
endfun
fun! CopyFilename()
    let @+ = expand("%:t")
endfun

" === Makes * and # work on visual ===

" From http://got-ravings.blogspot.com/2008/07/vim-pr0n-visual-search-mappings.html
function! s:VSetSearch(cmdtype)
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
  let @s = temp
endfunction

xnoremap * :<C-u>call <SID>VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch('?')<CR>?<C-R>=@/<CR><CR>

" recursively vimgrep for word under cursor or selection if you hit leader-star
if maparg('<leader>*', 'n') == ''
  nmap <leader>* :execute 'noautocmd vimgrep /\V' . substitute(escape(expand("<cword>"), '\'), '\n', '\\n', 'g') . '/ **'<CR>
endif
if maparg('<leader>*', 'v') == ''
  vmap <leader>* :<C-u>call <SID>VSetSearch()<CR>:execute 'noautocmd vimgrep /' . @/ . '/ **'<CR>
endif
