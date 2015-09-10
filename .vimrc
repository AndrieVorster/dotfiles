" VIM.
" Not needed.
set nocompatible
" Temp.
" No temp files.
set nobackup
set noswapfile
set nowritebackup
" UTF-8.
" I want UTF-8 thanks.
set encoding=utf-8
set fileencodings=utf-8
setglobal fileencoding=utf-8
" Plug.
" Manage plugins.
if empty(glob('~/.vim/autoload/plug.vim'))
        silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall
endif
" Plugs.
" Source of plugins.
call plug#begin()
Plug 'kien/ctrlp.vim'
"Plug 'kovisoft/slimv'
Plug 'tpope/vim-surround'
Plug 'ntpeters/vim-better-whitespace'
call plug#end()
" Wrap.
set wrap
set linebreak
" Timeout.
set ttimeout
set ttimeoutlen=10
" Numberline.
set number
" Hidden buffers.
set hidden
" Turnoff syntax.
syntax off
" Zero terminal colors.
set t_Co=0
" Show incomplete commands.
set showcmd
" Read outside changes to files.
set autoread
" Automatically write file changes.
set autowrite
" Use spaces instead of using tabs.
set expandtab
set tabstop=2
" Show matching bracket.
set showmatch
" Show 10 lines below current.
set scrolloff=10
" Save 1000 command histories.
set history=1000
" Numberline won't fill screen.
set numberwidth=2
" Allow proper use of backspace.
set backspace=eol,start,indent
" I have my own statusline taste.
set statusline=
set laststatus=2
set statusline+=%R\ %H\ %W\ %M\ %n\ %Y\ %{strlen(&fileencoding)?&fileencoding:'...'}\ %F\ %=\ %c/%l/%L\ %P
" Combine with the system clipboard.
set clipboard=unnamedplus
" Strip all the whitespaces on save.
autocmd BufWritePre * StripWhitespace
" Maps.
inoremap jk <esc>
inoremap <esc> <nop>
" Leader.
let mapleader = "\\"
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>
" CtrlP.
nnoremap <leader>p :CtrlP<cr>
" Search.
nnoremap <leader>h :set hlsearch<cr>
nnoremap <leader>hh :set nohlsearch<cr>
" The VimRC.
nnoremap <leader>v :e $MYVIMRC<cr>
nnoremap <leader>vv :source $MYVIMRC<cr>
" Relative linenumbers.
nnoremap <leader>r :set relativenumber<cr>
nnoremap <leader>rr :set norelativenumber<cr>
"let g:slimv_swank_cmd = '! tmux new-window -d -n REPL-SBCL "sbcl --load ~/.vim/plugged/slimv/slime/start-swank.lisp" &'
