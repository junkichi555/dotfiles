" start
filetype off
filetype plugin indent off

" edit
"-----------------------------------------------------------
syntax on
set mouse=a
set autoindent
set backspace=indent,eol,start
set showmatch
set wildmenu
set formatoptions+=mM
set number
set title
set fileformat=unix
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%
set lcs=tab:>.,trail:_,extends:\
set list
set noswapfile
set nocompatible

" tab
"-----------------------------------------------------------
set tabstop=4
set expandtab
set smartindent

set shiftwidth=4
set smarttab
au! BufNewFile,BufRead *.twig :set filetype=htmldjango

" utf-8
"----------------------------------------------------------
set termencoding=utf-8
set encoding=utf-8

if &encoding == 'utf-8'
    set ambiwidth=double
endif
scriptencoding cp932

" highlight
"---------------------------------------------------------
highlight String     ctermfg=brown guifg=Orange cterm=none gui=none
highlight MatchParen guifg=Yellow guibg=DarkCyan
highlight SignColumn guibg=#101020
highlight CursorIM   guifg=NONE guibg=Red
highlight CursorLine guifg=NONE guibg=#505050
set hlsearch

" set tabline
"---------------------------------------------------------
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

function! s:my_tabline()  "{{{
  let s = ''
  for i in range(1, tabpagenr('$'))
    let bufnrs = tabpagebuflist(i)
    let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
    let no = i  " display 0-origin tabpagenr.
    let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
    let title = fnamemodify(bufname(bufnr), ':t')
    let title = '[' . title . ']'
    let s .= '%'.i.'T'
    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let s .= no . ':' . title
    let s .= mod
    let s .= '%#TabLineFill# '
  endfor
  let s .= '%#TabLineFill#%T%=%#TabLine#'
  return s
endfunction "}}}
let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'
set showtabline=2 " 常にタブラインを表示

" Neobundle
"-----------------------------------------------------------
if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim
    call neobundle#rc(expand('~/.vim/bundle'))
endif

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'DirDiff.vim'
NeoBundle 'surround.vim'
NeoBundle 'xoria256.vim'

" NERD-tree
"---------------------------------------------------------
let NERDChristmasTree = 1
let g:NERDTreeDirArrows=0

nmap <Tab>      gt
nmap <S-Tab>    gT
autocmd vimenter * if !argc() | call s:OnlyTree() | endif
function! s:OnlyTree()
    NERDTree
    wincmd l
    q
endfunction

" lightline
"---------------------------------------------------------
set laststatus=2

let g:lightline = {
    \ 'colorscheme': 'landscape',
    \ }

" unite
"---------------------------------------------------------
let g:unite_split_rule = 'botright'
noremap uo <ESC>:Unite -vertical -winwidth=40 outline<Return>

" colorsheme
"---------------------------------------------------------
set t_Co=256
colorscheme xoria256

" option
"-------------------------------------------------------------------------
filetype plugin indent on
