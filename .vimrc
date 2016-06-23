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
