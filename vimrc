" vimrc: Vim preferences
" August Valera <avalera@ucsc.edu>

" junegunn/vim-plug
" Plugins for Vim
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
  \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugUpdate | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
Plug 'jiangmiao/auto-pairs'
Plug 'albertorestifo/github.vim'
Plug 'yggdroot/indentline'
Plug 'chiel92/vim-autoformat'
Plug 'conradirwin/vim-bracketed-paste'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-sensible'
call plug#end()
map <F12> :PlugUpdate<CR>q!<CR>

" Syntax color-coding
syntax on

" Mouse
set mouse=a
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

" PageUp and PageDown keys
map <PageUp> <C-U>
map <PageDown> <C-D>

" Shows matching braces and such
set showmatch

" Error sounds
set noerrorbells
set visualbell
set t_vb=
set tm=500

" Bottom bar
set ruler

" Highlighting search results
set hlsearch

" Regular expressions
set magic

" Use spaces instead of tabs, smart tabbing
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2

" Color scheme
set background=dark
colorscheme darkblue " Fallback colorscheme
set term=xterm-256color
let g:solarized_termcolors=256
let g:solarized_contrast="high"
colorscheme solarized

" Line numbers
set number

" Over 72 alert
match ErrorMsg '\%>72v.\+'

" Autoformat
map <F3> <Esc>:Autoformat<CR>i
imap <F3> <Esc><F3>
