"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Vundle
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible
syntax off
filetype plugin indent off

" runtimepath includes Vundle
set rtp+=~/.dotfiles/vim/bundle/Vundle.vim

" initialize Vundle
call vundle#begin('~/.dotfiles/vim/bundle')

" Vundle manages itself
Plugin 'VundleVim/Vundle.vim'

" Plugins

Plugin 'altercation/vim-colors-solarized'
if has('python')
  Plugin 'Valloric/YouCompleteMe'
endif
Plugin 'derekwyatt/vim-fswitch'
Plugin 'honza/vim-snippets'
Plugin 'jiangmiao/auto-pairs.git'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'lervag/vimtex'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'Yggdroot/indentLine.git'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'othree/javascript-libraries-syntax.vim'

call vundle#end()
