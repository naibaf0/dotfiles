"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Vundle
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" mandatory disabling of syntax and filetype before vundle call
syntax off
filetype off

" runtimepath includes Vundle
set rtp+=~/.dotfiles/vim/bundle/Vundle.vim

" initialize Vundle
call vundle#begin('~/.dotfiles/vim/bundle')

" Vundle manages itself
Plugin 'VundleVim/Vundle.vim'

" Plugins

" A color scheme
Plugin 'altercation/vim-colors-solarized'
" Autocompletion engine
Plugin 'Valloric/YouCompleteMe'
" autocompletion for javascript
Plugin 'ternjs/tern_for_vim'
" snippet engine
Plugin 'SirVer/ultisnips'
" snippet collection for popular languages
Plugin 'honza/vim-snippets'
" insertion and deletion of brackets, parens and quotes in pairs
Plugin 'jiangmiao/auto-pairs.git'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'lervag/vimtex'
" cool commenting features
Plugin 'scrooloose/nerdcommenter'
" Filetree inside vim
Plugin 'scrooloose/nerdtree'
" git plugin for the filetree
Plugin 'Xuyuanp/nerdtree-git-plugin'
" indentation lines are displayed
Plugin 'Yggdroot/indentLine.git'
" html5 omnicomplete and syntax
Plugin 'othree/html5.vim'
" javascript syntax
Plugin 'jelera/vim-javascript-syntax'
" syntax for javascript libraries
Plugin 'othree/javascript-libraries-syntax.vim'
" coffeescript support for vim
Plugin 'kchmck/vim-coffee-script'

call vundle#end()

" Enable filetype specific plugins and indentation
filetype plugin indent on

" Enable syntax highlighting.
syntax on

