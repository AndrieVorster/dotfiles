" ... {{{
set wrap
set spell
set number
set hidden
set showcmd
set autoread
set linebreak
set autowrite
set expandtab
set tabstop=2
set showmatch
set cursorline
set scrolloff=10
set history=1000
set numberwidth=2
set clipboard=unnamedplus
set backspace=eol,start,indent
" ~ {{{
set nobackup
set noswapfile
set nowritebackup
" }}}
" UTF-8 {{{
set encoding=utf-8
set fileencodings=utf-8
setglobal fileencoding=utf-8
" }}}
" }}}
" Statusline {{{
set statusline=
set laststatus=2
set statusline+=%R\ %H\ %W\ %M\ %n\ %Y\ %{strlen(&fileencoding)?&fileencoding:'...'}\ %F\ %=\ %c/%l/%L\ %P
" }}}
" Plug and Plugins {{{
" Plug {{{
if empty(glob('~/.vim/autoload/plug.vim'))
        silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall
endif
" }}}
" Plugins {{{
call plug#begin()
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'ntpeters/vim-better-whitespace'
Plug 'altercation/vim-colors-solarized'
call plug#end()
" }}}
" }}}
" Syntax and Colors {{{
if has('gui_running')
        " GUI {{{
        syntax on
        set guioptions=
        set guioptions+=aci
        set background=dark
        colorscheme solarized
        set gfn=Inconsolata\ Medium\ 13
        " }}}
elseif &term =~? 'rxvt*'
        " RXVT {{{
        syntax on
        set t_Co=256
        set background=dark
        colorscheme solarized
        " }}}
else
        " Other {{{
        syntax off
        set t_Co=0
        " }}}
endif
" }}}
" Normal Mode {{{
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>
" }}}
" Insert Mode {{{
inoremap jk <esc>
inoremap <esc> <nop>
" }}}
" Leader Mappings {{{
let mapleader = "\\"
nnoremap <leader>f :CtrlP<cr>
nnoremap <leader>p :set paste<cr>
nnoremap <leader>pp :set nopaste<cr>
nnoremap <leader>h :set hlsearch<cr>
nnoremap <leader>hh :set nohlsearch<cr>
nnoremap <leader>v :edit $MYVIMRC<cr>
nnoremap <leader>vv :source $MYVIMRC<cr>
nnoremap <leader>r :set relativenumber<cr>
nnoremap <leader>rr :set norelativenumber<cr>
" }}}
" VIM POWER ==? autocmd {{{
" Spaces {{{
augroup space
        autocmd!
        autocmd BufReadPre * StripWhitespace
        autocmd BufWritePre * StripWhitespace
augroup END
" }}}
" Vimfiles {{{
augroup vimfiles
        autocmd!
        autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}
" Lispfiles {{{
augroup lispfiles
        autocmd!
        autocmd FileType lisp inoremap lp ()<esc>i
augroup END
" }}}
" Perlfiles {{{
augroup perlfiles
        autocmd!
        autocmd FileType perl inoremap pp print (, "\n");<esc>F(a
        autocmd FileType perl inoremap ppb print (oct("0b"), "\n");<esc>Fba
        autocmd FileType perl inoremap pfs #!/usr/bin/perl<esc>o<esc>xiuse warnings;<esc>o<esc>o
augroup END
" }}}
" Bashfiles {{{
augroup bashfiles
        autocmd!
        autocmd FileType sh setlocal foldmethod=marker
augroup END
" }}}
" Save cursor {{{
" % = Buffer list.
" ' = For file marks.
" : = For command history.
" \" = For register history.
" n(path) = To change .viminfo path.
"set viminfo=%,'100,\"100
function! Cursorsave()
        if line("'\"") <= line("$")
                normal! g`"
                return 1
        endif
endfunction
augroup cursorsave
        autocmd!
        autocmd BufWinEnter * call Cursorsave()
augroup END
" }}}
" }}}
