version 6.0
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
nmap gx <Plug>NetrwBrowseX
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetrwBrowseX(expand("<cWORD>"),0)
let &cpo=s:cpo_save
unlet s:cpo_save

"Indentation
set autoindent
set smartindent
set tabstop=4
set expandtab
set shiftwidth=4

set backspace=indent,eol,start
set cscopeprg=/usr/bin/cscope
set cscopetag
set cscopeverbose
set fileencodings=ucs-bom,utf-8,latin1
set formatoptions=tcql
set guicursor=n-v-c:block-Cursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175,a:blinkon0
set guifont=Monospace\ 8
set helplang=fr
set history=50
set hlsearch
set mouse=a
set ruler
set termencoding=utf-8
set viminfo='20,\"50
set wildignore=*.pyc
set window=48

set number


filetype plugin on
set ofu=syntaxcomplete#Complete
"autocmd FileType python set omnifunc=pythoncomplete#Complete

let Tlist_Auto_Open=1
let Tlist_Use_Right_Window=1
let Tlist_Show_One_File=1

"theme
set background=dark
colorscheme slate
" vim: set ft=vim :
