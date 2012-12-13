""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Get out of VI's compatible mode..
set nocompatible

set autoread
set autowrite

set nobackup
set nowritebackup

set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set smarttab

set backspace=eol,start,indent

set incsearch
set hlsearch
set ignorecase

" The current buffer can be put to the background without 
" writing to disk
set hidden

set nowrap
set textwidth=0
set wildmode=longest,list

set smartindent
set autoindent
set cindent
set cinoptions=:s,ps,ts,cs
set cinwords=if,else,while,do,for,switch,case

syntax on
filetype plugin indent on

set ruler
set number

" Clipboard
set clipboard+=unnamed

" for new-omni-completion
set completeopt=longest,menu

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Status Line
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always hide the statusline
set laststatus=2
" Format the statusline
set statusline=
set statusline+=%2*%-3.3n%0*\                " buffer number
set statusline+=%f\                          " file name
set statusline+=%h%1*%m%r%w%0*               " flags
set statusline+=\[%{strlen(&ft)?&ft:'none'}, " filetype
set statusline+=%{&fileencoding},            " encoding
set statusline+=%{&encoding},                " encoding
set statusline+=%{&fileformat}]              " file format
set statusline+=%=                           " right align
set statusline+=%2*0x%-8B\                   " current char
set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Chinese
" multi-encoding setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("multi_byte")
  "set bomb 
  set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,sjis,euc-kr,ucs-2le,latin1 
  " CJK environment detection and corresponding setting 
  if v:lang =~ "^zh_CN" 
    " Use cp936 to support GBK, euc-cn == gb2312 
    set encoding=chinese 
    set termencoding=chinese 
    set fileencoding=chinese 
  elseif v:lang =~ "^zh_TW" 
    " cp950, big5 or euc-tw 
    " Are they equal to each other? 
    set encoding=taiwan 
    set termencoding=taiwan 
    set fileencoding=taiwan 
  endif 
  " Detect UTF-8 locale, and replace CJK setting if needed 
  if v:lang =~ "utf8$" || v:lang =~ "UTF-8$" 
    set encoding=utf-8 
    set termencoding=utf-8 
    set fileencoding=utf-8 
  endif 
endif 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Gui
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('gui_running')
  set guioptions-=T  " no toolbar
  set guifont=Consolas:h11:cANSI
  set columns=85
  colorscheme darkblue 
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key Mapping
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Set mapleader
let mapleader = ","
let g:mapleader = ","

"Fast saving
nmap <silent> <leader>ww :w<cr>
nmap <silent> <leader>wf :w!<cr>
nmap <silent> <leader>wu  :up<cr>

"Fast quiting
nmap <silent> <leader>qw :wq<cr>
nmap <silent> <leader>qf :q!<cr>
nmap <silent> <leader>qq :q<cr>
nmap <silent> <leader>qa :qa<cr>

imap jj <ESC>

" tag previous and next
nmap tj :tn<cr>
nmap tk :tp<cr>

" grep find
nnoremap <silent> <F3> :Grep<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle
" :BundleInstall
" vim +BundleInstall +qall
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'The-NERD-tree'

Bundle "git.zip"
Bundle "fugitive.vim"

Bundle "ragtag.vim"
Bundle "surround.vim"

Bundle "tComment"

Bundle "https://github.com/majutsushi/tagbar.git"
Bundle "https://github.com/xolox/vim-easytags.git"

Bundle "a.vim"
Bundle "c.vim"

