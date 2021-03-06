set encoding=utf-8

" ---------------------------------------------------
" basic setting
" ---------------------------------------------------
set number
set list
set listchars=tab:>_,trail:_,nbsp:%,extends:>,precedes:<
set incsearch
set hlsearch
set showmatch
set matchtime=1
set whichwrap=h,l
set display=lastline
set nowrapscan
set ignorecase
set smartcase
set history=2000
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set nobackup
set noswapfile

" ---------------------------------------------------
" neobundle setting
" ---------------------------------------------------
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'xoria256.vim'

call neobundle#end()

filetype plugin indent on

" ---------------------------------------------------
" color setting
" ---------------------------------------------------
syntax enable
set t_Co=256
colorscheme xoria256

au! BufNewFile,BufRead *.twig :set filetype=htmldjango

" ---------------------------------------------------
" NERDTree setting
" ---------------------------------------------------
let NERDChristmasTree = 1
let g:NERDTreeDirArrows = 0

nmap <Tab>      gt
nmap <S-Tab>    gT

autocmd vimenter * if !argc() | call s:OnlyTree() | endif
function! s:OnlyTree()
    NERDTree
    wincmd l
    q
endfunction

" ---------------------------------------------------
" key bind
" ---------------------------------------------------
nmap fn ]m
nmap fp [m

nnoremap sh <C-w>h
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap s> <C-w>>
nnoremap s< <C-w><
nnoremap s+ <C-w>+
nnoremap s- <C-w>-

let g:syntastic_python_checkers = ["flake8"]
