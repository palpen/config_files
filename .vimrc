" Package manager: vim-plug

" Inspired by https://github.com/jvns/vimconfig/blob/master/vimrc

" === Basic settings ===
set showmatch
set visualbell
set ignorecase
set incsearch
set statusline=2
set statusline=%f
set ruler
set copyindent


" === General ====
set belloff=all

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","


" === Text, tab, and indentation ====

" Use spaces instead of tabs
set expandtab

" Make tab usage smart
set smarttab

" Linebreak at whitespace
set lbr
set tw=0

" 1 tab == 4 spaces
set tabstop=4
set shiftwidth=4

set autoindent
set smartindent


" === Colors and fonts ===

" Set syntax highlighting on
syntax on

" Set font size
set guifont=Menlo\ Regular:h20

try
    colorscheme desert
catch
endtry

" === VIM UI ===

" Highlight line cursor is on
set cursorline

" Display line number
set number

" Leave 5 lines before or after cursor when scrolling vertically (j,k)
set scrolloff=5

" ???
set smartcase

" When wrapping long lines, prefix conitnuation of line with +++
set showbreak=+++

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

" ???
set backspace=indent,eol,start

" Highlight search results
set hlsearch

" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c


" === Third-party packages and settings ===

" External packages managed using vim-plug
call plug#begin()
Plug 'airblade/vim-gitgutter'
Plug 'morhetz/gruvbox'
call plug#end()

" for vim-gitgutter
set updatetime=100

" gruvbox color scheme
autocmd vimenter * ++nested colorscheme gruvbox


" === New tab ===
" Quickly open a buffer for scribble
map <leader>t :tabnew<cr>


" === Persistent undo ===

set undofile                " Save undos after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo


" === Moving around tabs, windows, and buffers ===

" Remap movement across windows keys
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/


" === Misc. aesthetics ===

" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Color column 80
" To turnoff, set cc=
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey


" === Shortcuts and other key mappings ===

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" Redraws the screen and removes any search highlighting.
nmap <Leader>n :nohlsearch<CR>

" Compiles a Makefile ???
nmap <Leader>m :make<CR>

" Overwrites
command! W :w
command! Q :q

" Return to last edit position when opening files (You want this!)
" source: Julia Evan's vimrc
"au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Trim whitespace on save for some filetypes
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
if has("autocmd")
    autocmd BufWritePre *.go,*.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call TrimWhitespace()
endif


" === Helper functions ===

" Copy paths current file to system clipboard
" Usage: `:call CopyRelPath()`
fun! CopyRelPath()
    let @+ = expand("%")
endfun
fun! CopyAbsPath()
    let @+ = expand("%:p")
endfun
fun! CopyFilename()
    let @+ = expand("%:t")
endfun

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

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction


