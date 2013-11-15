""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle
" :BundleInstall
" vim +BundleInstall +qall
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible     " do not compatible with vi
filetype off

set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" Nerd Tree
Bundle 'https://github.com/scrooloose/nerdtree.git'

"Git Wrapper
Bundle 'git://github.com/tpope/vim-fugitive.git'

" Bundle "https://github.com/majutsushi/tagbar.git"
" Bundle "https://github.com/xolox/vim-easytags.git"

" header/source switch
Bundle "a.vim"

" C/C++ IDE
" Bundle "c.vim"

syntax on
filetype plugin indent on

" vundle finished

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ruler
set number
set nobackup
set backspace=eol,start,indent
set shiftwidth=4
set tabstop=4
set softtabstop=4
" use space instead tab
set expandtab
set smarttab

set nobackup
set nowritebackup

set hidden

set nowrap

set incsearch
set hlsearch
set ignorecase

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" For C++
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set smartindent
set autoindent
set cindent

syntax enable
syntax on

filetype on
filetype plugin on
filetype indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Chinese multi-encoding setting
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("multi-byte")
	set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,latin1
	if v:lang =~ "^zh_CN"
		set encoding=chinese
		set termencoding=chinese
		set fileencoding=chinese
	endif

	if v:lang =~ "utf8$" || v:lang=~ "UTF-8$"
		set encoding=utf-8
		set termencoding=utf-8
		set fileencoding=utf-8
	endif
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Gui Running
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("gui_running")
	set guioptions-=T
	set guifont=Consolas:h11:cANSI
	set columns=85
	colorscheme darkblue
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" key mapping
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
imap jj <ESC>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Status Line
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

