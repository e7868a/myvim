""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Get out of VI's compatible mode..
set nocompatible

set ruler
set number
set nobackup
set backspace=eol,start,indent
set shiftwidth=4
set tabstop=4
set softtabstop=4
set incsearch
set hlsearch
set ignorecase

"Always hide the statusline
set laststatus=2
"Format the statusline
set statusline=
set statusline+=%2*%-3.3n%0*\                " buffer number
set statusline+=%f\                          " file name
set statusline+=%h%1*%m%r%w%0*               " flags
set statusline+=\[%{strlen(&ft)?&ft:'none'}, " filetype
set statusline+=%{&fileencoding},                " encoding
set statusline+=%{&encoding},                " encoding
set statusline+=%{&fileformat}]              " file format
set statusline+=%=                           " right align
set statusline+=%2*0x%-8B\                   " current char
set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" For C/C++
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set smartindent
set autoindent
set cindent

syntax enable
syntax on

" pathogen plugin
call pathogen#runtime_append_all_bundles()

filetype on
filetype plugin on 
filetype indent on

" for new-omni-completion
set completeopt=longest,menu

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

" build tags database for C++
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
" tag previous and next
nmap tj :tn<cr>
nmap tk :tp<cr>

" grep find
nnoremap <silent> <F3> :Grep<CR>
