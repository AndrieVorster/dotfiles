" andrievorster@gmail.com
" andrievorster.github.io
" Andrie Vorster's '.vimrc'!
" I don't plan on documenting a lot here!
set nocp " It's not needed because this file exists... But it's tradition so I have to set it!
" ? {{{
"if has('nvim')
"endif
" }}}
" ~ {{{
" Undo {{{
set undofile
set undoreload=100000
set undolevels=100000000
set undodir=$HOME/.vim/undofiles
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif
" }}}
" Swap {{{
set swapfile
"set noswapfile
set directory=$HOME/.vim/swapfiles
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif
" }}}
" Backup {{{
set backup
set writebackup
"set nobackup
"set nowritebackup
set backupdir=$HOME/.vim/backupfiles
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif
" }}}
" }}}
" ... {{{
" ...
set title
set ruler
set hidden
set noexrc
set showcmd
set showmode
set notimeout
set autoindent
set cursorline
set history=1000
set noerrorbells
" Wrap
set wrap
set linebreak
" Tabs
set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4
" Speed
set ttyfast
set lazyredraw
" Visibility
set number
set scrolloff=10
set numberwidth=2
set nostartofline
" File changes
set autoread
set autowrite
" Run on whitespaces
set virtualedit=
"set virtualedit+=all
" Show all chars/breaks
set list
set showbreak=↪
set listchars=eol:¬,tab:▸\ ,extends:❯,precedes:❮
" Same advanced settings
set clipboard=unnamedplus
set fileformats=unix,dos,mac
set backspace=eol,start,indent
set completeopt=menuone,longest,preview
" UTF-8 {{{
set encoding=utf-8
set fileencodings=utf-8
setglobal fileencoding=utf-8
" }}}
" Search {{{
set gdefault
set incsearch
set showmatch
" }}}
" Wildmenu {{{
set wildmenu
set wildmode=list:longest
set wildignore=
set wildignore+=.git
set wildignore+=.a,.o,.tmp
" }}}
" Spelling {{{
set spell
set dictionary=/usr/share/dict/words
set spellfile=$HOME/.vim/.vimdictionary.utf-8.add
" }}}
" }}}
" Statusline {{{
set statusline=
set laststatus=2
set statusline+=%R\ %H\ %W\ %M\ %n\ %Y\ %{strlen(&fileencoding)?&fileencoding:'...'}\ %F\ %=\ %c/%l/%L\ %P
" }}}
" Plug and Plugins {{{
" Plug {{{
if !filereadable(expand($HOME.'/.vim/autoload/plug.vim'))
    silent !curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif
" }}}
" Plugins {{{
call plug#begin()
Plug 'sjl/badwolf'
Plug 'kien/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-surround'
Plug 'ntpeters/vim-better-whitespace'
Plug 'altercation/vim-colors-solarized'
call plug#end()
" }}}
" Plugin Settings {{{
" CtrlP {{{
let g:ctrlp_use_caching = 0
" }}}
" }}}
" }}}
" Syntax and Colors {{{
set background=dark
"set background=light
"colorscheme badwolf
colorscheme solarized
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'
if has('gui_running')
    syntax enable
    set guioptions=
    set guioptions+=aci
    set gfn=Inconsolata\ Medium\ 12
elseif &term =~? 'xterm-256color'
    set t_Co=256
    syntax enable
elseif &term =~? 'rxvt-unicode-256color'
    set t_Co=256
    syntax enable
else
    set t_Co=0
    syntax off
endif
" }}}
" Modes {{{
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
" }}}
" Visual Mode {{{
vnoremap <Space> za
" }}}
" Normal Mode {{{
nnoremap <Space> za
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
" }}}
" Insert Mode {{{
inoremap jk <esc>
inoremap <esc> <nop>
inoremap <expr> j pumvisible() ? '<C-n>' : 'j'
inoremap <expr> k pumvisible() ? '<C-p>' : 'k'
" }}}
" Plugin Mode {{{
nnoremap <silent> <c-p> :CtrlP<cr>
nnoremap <silent> <c-t> :TagbarToggle<cr>
" }}}
" Command Mode {{{
cnoremap w!! w !sudo tee % >/dev/null<cr>
" }}}
" Abbreviations {{{
iabbrev apve <c-r>=("® andrievorster@gmail.com")<cr>
iabbrev apvw <c-r>=("® andrievorster.github.io")<cr>
iabbrev apvc <c-r>=strftime("© Andrie Vorster All Rights Reserved %Y")<cr>
" }}}
" Leader Mappings {{{
let mapleader = "\\"
set pastetoggle=<c-i>
nnoremap <leader>l `.
nnoremap <leader>s gg0=G
nnoremap <leader>q :q<cr>
nnoremap <leader>Q :q!<cr>
nnoremap <leader>w :w<cr>
nnoremap <leader>W :w!<cr>
nnoremap <leader>h :set hlsearch<cr>
nnoremap <leader>nh :set nohlsearch<cr>
nnoremap <leader>r :set relativenumber<cr>
nnoremap <leader>nr :set norelativenumber<cr>
" Line swapping
nnoremap <leader>lca VxkP<cr>
nnoremap <leader>lab kVxp<cr>
nnoremap <leader>lba jVxkP<cr>
" Quickly edit dot/settings files
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>eb :split $HOME/.bashrc<cr>
nnoremap <leader>ed :split $HOME/vim/.vimdictionary.utf-8.add<cr>
" }}}
" VIM POWER ==? autocmd {{{
" Save {{{
augroup save
    autocmd!
    autocmd FocusLost * :silent! wall
    autocmd FocusGained * :silent! wall
augroup END
" }}}
" Spaces {{{
augroup space
    autocmd!
    autocmd BufRead * StripWhitespace
    autocmd BufWrite * StripWhitespace
augroup END
" }}}
" Vimfiles {{{
augroup vimfiles
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
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
augroup cursorsave
    autocmd!
    autocmd BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \     execute 'normal! g`"zvzz' |
                \ endif
augroup END
"function! Cursorsave()
"if line("'\"") <= line("$")
"normal! g`"
"return 1
"endif
"endfunction
"augroup cursorsave
"autocmd!
"autocmd BufWinEnter * call Cursorsave()
"augroup END
" }}}
" }}}
