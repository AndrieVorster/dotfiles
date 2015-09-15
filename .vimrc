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
Plug 'tpope/vim-surround'
Plug 'AndrieVorster/cursor'
Plug 'AndrieVorster/mappings'
Plug 'ntpeters/vim-better-whitespace'
Plug 'altercation/vim-colors-solarized'
call plug#end()
" Wrap.
set wrap
set linebreak
" Spell.
set spell
" Timeout.
set ttimeout
set ttimeoutlen=1
" Numberline.
set number
" Hidden buffers.
set hidden
" The cursor line.
set cursorline
" Syntax and colorscheme.
if has('gui_running')
        syntax on
        set guioptions=
        set guioptions+=aci
        set background=dark
        colorscheme solarized
        set gfn=Inconsolata\ Medium\ 14
elseif &term =~? 'rxvt*'
        syntax on
        set t_Co=256
        set background=dark
        colorscheme solarized
else
        syntax off
        set t_Co=0
endif
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
" Saves 1000 lines of history.
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
" Strip all the whitespaces on read/write.
autocmd BufReadPre * StripWhitespace
autocmd BufWritePre * StripWhitespace
