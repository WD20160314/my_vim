" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2000 Mar 29
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

let mapleader=" "
nnoremap <Space> <Nop>
set nowrap         " Don't wrap long lines
set autoindent     " Do auto-indenting
set nocindent      " But don't do wacky C style indenting
set bs=2		   " allow backspacing over everything in insert mode
set showmatch      " always set showmatch on
set expandtab      " Use spaces instead of tabs
set softtabstop=4  " Use spaces instead of tabs
set tabstop=4      " If you insist on using tabs, use the same tabstop
set nobackup	   " keep a backup file (defaults to .filename~)   set no backup
set viminfo='20,\"50  " read/write a .viminfo file, don't store more than 50 lines of registers
set history=50     " keep 50 lines of command line history
set ruler          " show the cursor position all the time
set nu             
set shiftwidth=4
set smartindent
set noswapfile          " 禁止生成临时文件
set autoread            " 文件在vim之外修改过，自动重新读入
set autowrite           " 设置自动保存
set confirm             " 在处理未保存或只读文件的时候，弹出确认
set cursorline cursorcolumn

colorscheme desert
" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

if has("autocmd")
    autocmd BufNewFile,BufRead Makefile set noexpandtab " Makefiles ensure that we don't expand tabs since tabs are special
endif


" lhs comments -- select a range then hit ,# to insert hash comments
" or ,/ for // comments, or ,c to clear comments.
map ,# :s/^/#/<CR> <Esc>:nohlsearch <CR>
map ,/ :s/^/\/\//<CR> <Esc>:nohlsearch <CR>
map ,c :s/^\/\/\\|^--\\|^> \\|^[#"%!;]//<CR> <Esc>:nohlsearch<CR>

" wrapping comments -- select a range then hit ,* to put  /* */ around
" selection, or ,d to clear them
map ,* :s/^\(.*\)$/\/\* \1 \*\//<CR> <Esc>:nohlsearch<CR>
map ,d :s/^\([/(]\*\\|<!--\) \(.*\) \(\*[/)]\\|-->\)$/\2/<CR> <Esc>:nohlsearch<CR>

" to clear hlsearch -- hit ,h to clear highlighting from last search
map ,h :nohlsearch <CR>

" ignore-case on
set ignorecase
set smartcase

set langmenu=zh_CN.UTF-8
set helplang=cn
set termencoding=utf-8
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,gbk,cp936,gb2312,gb18030

map S :w!<CR>
map Q :q!<CR>
map R :source $MYVIMRC<CR>

map sl :set splitright<CR>:vsplit<CR>
map sh :set nosplitright<CR>:vsplit<CR>
map sj :set nosplitbelow<CR>:split<CR>
map sk :set splitbelow<CR>:split<CR>

 nnoremap <leader>h <C-w>h
 nnoremap <leader>j <C-w>j
 nnoremap <leader>k <C-w>k
 nnoremap <leader>l <C-w>l

" Use alt + hjkl to resize windows
nnoremap <silent> <M-j>    :resize -5<CR>
nnoremap <silent> <M-k>    :resize +5<CR>
nnoremap <silent> <M-h>    :vertical resize -3<CR>
nnoremap <silent> <M-l>    :vertical resize +3<CR>

map tu :tabe<CR>
map tj :-tabnext<CR>
map tk :+tabnext<CR>

map T :Tags<CR>

map wv <C -w>t<C -w>H
map wh <C -w>t<C -w>K

noremap = nzz
noremap - Nzz
noremap <leader><CR> :nohlsearch<CR>

noremap wr :set wrap
noremap nowr :set nowrap

noremap <leader><CR> :nohlsearch<CR>
  " find and replace
  noremap \s :%s//g<left><left>
  noremap \d :g//d<left><left>
  noremap \nd :g!//d<left><left>

let g:ackprg = 'ag --vimgrep'

call plug#begin('~/.vim/plugged')
    Plug 'sheerun/vim-polyglot'
    Plug 'scrooloose/NERDTree'
    Plug 'jiangmiao/auto-pairs'
    Plug 'christianchiarulli/onedark.vim'
    Plug 'vim-airline/vim-airline'
    Plug 'vhda/verilog_systemverilog.vim'
    Plug 'godlygeek/tabular'
    Plug 'vim-ruby/vim-ruby'
    Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
    Plug 'junegunn/fzf', {'do': 'make sync'}
    Plug 'junegunn/fzf.vim'
    Plug 'airblade/vim-rooter'
    Plug 'vim-scripts/taglist.vim'

call plug#end()


"let g:onedark_termcolors=256
"colorscheme onedark

nnoremap <leader>u :VerilogGotoInstanceStart<CR>
nnoremap <leader>i :VerilogFollowInstance<CR>
nnoremap <leader>I :VerilogFollowPort<CR>
runtime macros/matchit.vim

" ===
" === NERDTREE
" ===
nnoremap <silent> <F3> :NERDTreeToggle<cr>
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1         
let g:NERDTreeHighlightFoldersFullName = 1 
" let g:NERDTreeDirArrowExpandable='▷'
" let g:NERDTreeDirArrowCollapsible='▼'

 
" ===
" === taglist
" ===
let Tlist_Ctags_Cmd = '/tool/pandora64/bin/ctags'
let Tlist_Show_One_File = 1   
let Tlist_Exit_OnlyWindow = 1 
" let Tlist_Use_Right_Window = 1
" let Tlist_Compact_Format = 1    "

" ===
" === tabular
" ===
vmap ga :Tabularize /
