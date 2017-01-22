" vimoc: part of the 4U6U57/dotfiles project
" A configuration file for the Vim text editor
" Sets vim preferences and imports various plugins I find useful
" Note some preferences are externalized to the file ~/.editorconfig

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" INSTALLATION/UPDATING

" Vimrc is maintained through 4U6U57/dotfiles, and can be updated by:
" running :VimrcUpdate or by pressing <F12> in Normal mode
" TODO: If you modify this file to suit your own needs, you MUST modify
" the following line or the VimrcUpdate script will revert your changes
" OVERWRITE: true
"
" For more information, see https://github.com/4U6U57/dotfiles

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN IMPORTS

" junegunn/vim-plug
" Plugins for Vim
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com
        \/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugUpdate | source $MYVIMRC
  !echo [vimrc] This is your first time running vim after installing
        \ 4U6U57/dotfiles's vimrc. As soon as it\'s done installing, I
        \ highly suggest you run the Vim command :VimrcUpdate to make
        \ sure all dependencies are installed. This is also the way to
        \ update it when future versions of the plugins are released.
        \ Also, please ignore the following errors, they are
        \ expected and unavoidable. Have fun with your new Vim\!
endif
call plug#begin('~/.vim/plugged')
Plug 'jiangmiao/auto-pairs'
Plug 'editorconfig/editorconfig-vim'
Plug 'albertorestifo/github.vim'
Plug 'othree/html5.vim'
Plug 'yggdroot/indentline'
Plug 'gregsexton/matchtag'
Plug 'ervandew/supertab'
Plug 'bronson/vim-trailing-whitespace'
Plug 'bling/vim-airline'
Plug 'chiel92/vim-autoformat'
Plug 'conradirwin/vim-bracketed-paste'
Plug 'altercation/vim-colors-solarized'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'airblade/vim-gitgutter'
Plug 'gabrielelana/vim-markdown'
Plug 'tpope/vim-sensible'
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" GENERAL PREFERENCES

" Syntax color-coding
syntax on

" Shows matching braces and such
set showmatch

" Error sounds
set noerrorbells
set visualbell
set t_vb=
set tm=500

" Highlighting search results
set hlsearch

" Regular expressions
set magic

" Use spaces instead of tabs, smart tabbing
set expandtab
set smarttab
" set shiftwidth=2
set tabstop=2

" Color scheme
" Note that this is overriden by vim-colors-solarized
set background=dark
colorscheme darkblue
set term=xterm-256color

" Line numbers
set number

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" KEYBINDINGS

" Mouse
set mouse=a
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

" PageUp and PageDown keys
map <PageUp> <C-U>
map <PageDown> <C-D>

" Autoformat
map <F3> <Esc>:Autoformat<CR>i
imap <F3> <Esc><F3>

" Update Vimrc
function! VimrcUpdater()
  if empty(glob('~/.dotfiles')) &&
        \ match(readfile('~/.vimrc'),'OVERWRITE: true')
    silent !curl -fLo ~/.vimrc --create-dirs
          \ https://raw.githubusercontent.com
          \/4U6U57/dotfiles/master/vimrc
          \ && echo "[vimrc] updated by curl"
  else
    !echo "[vimrc] ignored: update with dotfiles"
  endif
  if empty(glob('~/.editorconfig')) || empty(glob('~/.dotfiles')) &&
        \ (filereadable('~/.editorconfig') &&
        \ match(readfile('~/.editorconfig'),
        \'part of the 4U6U57/dotfiles project') &&
        \ match(readfile('~/.editorconfig'),'OVERWRITE: true'))
    !curl -fLo ~/.editorconfig --create-dirs
          \ https://raw.githubusercontent.com
          \/4U6U57/dotfiles/master/editorconfig
          \ && echo "[editorconfig] updated by curl"
  else
    !echo "[editorconfig] ignored: to keep edits"
  endif
  PlugUpdate
  :q!
endfunction
command! VimrcUpdate call VimrcUpdater()
map <F12> :VimrcUpdate<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN PREFERENCES

" vim-airline
let g:airline#extensions#tabline#enabled = 1

" vim-colors-solarized
let g:solarized_termcolors=256
let g:solarized_contrast="high"
colorscheme solarized

" vim-editorconfig
" let g:EditorConfig_max_line_indicator = "fill"

" vim-gitgutter
let g:gitgutter_realtime = 1

" indentline
let g:indentLine_color_term = 236
