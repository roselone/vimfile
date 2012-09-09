set number 			"show line number
set ruler			"show column number
set showcmd			"show cmd in status line

"for dark background
"set background=dark
colorscheme desert

"F2 show|hide line number
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>

syntax enable
syntax on	 		"highlight

set noeb			"rm error sound
set nocp

set autoindent
set cindent

set tabstop=4
set softtabstop=4
set shiftwidth=4

set hlsearch
set incsearch

set encoding=utf-8
set fileencodings=utf-8,gbk,gb18030,gb2312,cp936

"================================================
"script manager
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'fugitive.vim'
Bundle 'L9'
Bundle 'scrooloose/nerdcommenter'
Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/nerdtree'
"================================================

filetype on
filetype plugin on
filetype indent on

let mapleader = ","
let g:netrw_winsize=30

"===============================================
"autocomplete
set completeopt+=longest	"VImTip1228
"auto close preview
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"enter return to choose
inoremap <expr> <CR>		pumvisible() ? "\<C-y>" : "\<CR>"

inoremap <expr> <Down>		pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>		pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown>	pumvisible() ? "<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>	pumvisible() ? "<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

"================================================
"edit vimrc
map <silent><leader>ee :e ~/.vimrc<CR>
"nmap <silent><leader>nt :Sexplor!<cr>

"syntax using vimrc
autocmd! bufwritepost .vimrc source ~/.vimrc

"================================================
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
"let Tlist_Use_Right_Window = 1

"use native tags
"set tags=tagsfile

let g:NERDTree_title="NERD Tree"

function! NERDTree_Start()
	exec 'NERDTree'
endfunction

function! NERDTree_IsValid()
	return 1
endfunction

let g:winManagerWindowLayout = "NERDTree|TagList"
let g:winManagerWidth = 30
let g:defaultExplorer = 0
nmap wm :WMToggle<CR>

let g:tarbar_ctags_bin = '/usr/local/bin/ctags'
let g:tagbar_width = 30
nnoremap <leader>tb :TagbarToggle<CR>

if has("cscope")
	set csprg=/usr/local/bin/cscope
	set csto=0
	set cst
	set nocsverb
	"add any database in current directory
	if filereadable("cscope.out")
		cs add cscope.out
	elseif $CSCOPE_DB != ""
		cs add $CSCOPE_DB
	endif
	set csverb
endif
