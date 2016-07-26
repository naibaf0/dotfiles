"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Install plugins with plug
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin()
" A color scheme
Plug 'altercation/vim-colors-solarized'
" Stylish statusline and themes
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
" show git-diff in the sign column
Plug 'airblade/vim-gitgutter'
" Undo visualization
Plug 'sjl/gundo.vim'
" Fuzzy filesearch
Plug 'ctrlpvim/ctrlp.vim'
" Autocompletion engine
Plug 'Shougo/deoplete'
Plug 'Shougo/neoinclude.vim'
Plug 'Shougo/neco-syntax'
" snippet engine | collection
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
" vim support for go
Plug 'fatih/vim-go', { 'for': 'go', 'tag': '*', 'do': ':GoInstallBinaries'}
" vim support for LaTeX
Plug 'lervag/vimtex', { 'for': 'tex'}
" syntax checker
Plug 'scrooloose/syntastic'
" cool commenting features
Plug 'scrooloose/nerdcommenter'
" Filetree inside vim | git plugin for the filetree
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } | Plug 'Xuyuanp/nerdtree-git-plugin'
" insertion and deletion of brackets, parens and quotes in pairs
Plug 'jiangmiao/auto-pairs'
" indentation lines are displayed
Plug 'Yggdroot/indentLine'
" html5 support
Plug 'othree/html5.vim', { 'for': 'html' }
" faster yaml syntax
Plug 'stephpy/vim-yaml', { 'for': 'yaml' }
" json support
Plug 'elzr/vim-json', { 'for': 'json' }
" javascript syntax
Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }
" syntax for javascript libraries
Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'javascript' }
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" General behavior of Vim
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use vim with light color theme
set background=light

" Use solarized theme
colorscheme solarized

" Set the standard encoding
set encoding=utf8

filetype plugin indent on
syntax on

" Set the height of the command bar
set cmdheight=1

" Always show the status line
set laststatus=2

" Always show tab line
set showtabline=1

" Show (partial) command in status line
set showcmd

" Show line numbers on the side
set number
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber
set relativenumber

" Set whether a line that doesn't fit into a window is wrapped around
" at the end of the window.
set nowrap

" Make Vim wrap long lines at specified characters instead of wrapping
" at the last character in the line.
set linebreak

" Makes Vim ask for a confirmation instead of showing an error
" message.
set confirm

" Show a vertical line at column 80
set colorcolumn=80


" set window sizing
set winminwidth=20
set winheight=7
set winminheight=7

" Set the maximum width of text that is being inserted without breaking
" it to a new line.
" Setting this value to '0' disables this option.
set textwidth=80

" autocomplete commands and filepaths in the vim-cl
set wildchar=<Tab> wildmenu wildmode=full

" Show the cursor line by default
set cursorline

" Make 'word' stop at underscores. Does not affect 'Word'.
set iskeyword-=_

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Scrolling properties
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set leading/trailing lines for the cursor when moving vertically.
set scrolloff=7

" Set leading/trailing columns for the cursor when moving
" horizontally.
set sidescrolloff=20

" Set the amount of columns to scroll horizontally, when the end of
" the window is reached.
set sidescroll=35

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Indentation rules
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Number of spaces a <Tab> counts for
set tabstop=2

" Number of spaces that a <Tab> counts for while performing editing operations.
set softtabstop=2

" Number of spaces to use for each step of (auto)indent.
set shiftwidth=2

" When on, a <Tab> in front of a line inserts blanks according to 'shiftwidth'.
" 'tabstop' is used in other places. A <BS> will delete a 'shiftwidth' wide
" bunch of space at the start of the line. What gets inserted
" (a <Tab> or spaces) depends on the 'expandtab' option.
set smarttab

" Use the appropriate number of spaces to insert a <Tab>.  Spaces are used in
" indents with the '>' and '<' commands and when 'autoindent' is on.
" To insert a real tab when 'expandtab' is on, use CTRL-V <Tab>.
set expandtab

" Copy indent from current line when starting a new line (typing <CR>
" in Insert Mode or when using the "o" or "O" command).
set autoindent

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Search properties
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Allow 'search next' to jump back to the beginning of the file if the
" end was reached (equivalent for 'search previous').
set nowrapscan

" Set whether to highlight matches for previous search patterns.
set hlsearch

" While typing a search command, show immediately where the so far
" typed pattern matches.
set incsearch

" Ignore the case when searching
set noignorecase

" When searching, try to be smart about cases
set smartcase

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" User-defined folding
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Define where to create folds
set fdm=manual

" Set the number of screen line above which a fold can be displayed closed.
set fml=5

" Define the maximum nesting of folds (for the 'indent' and 'syntax' methods).
set fdn=3

" Specify the text displayed for a closed fold.
"set fdt=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Spelling
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Disable spellchecking by default
set nospell

" Set languages for spell checking
set spelllang=en_US

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Vim auto save
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup save
  au!
  au FocusLost * wall
augroup END
set nohidden
set nobackup
"set noswapfile
set nowritebackup
set autoread
set autowrite
set autowriteall

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Persistent undo
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set undodir=~/.config/nvim/undo
set undofile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Format options
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This is a sequence of letters which describes how automatic formatting is to
" be done.
"
" letter    meaning when present in 'formatoptions'
" ------    ---------------------------------------
" c         Auto-wrap comments using textwidth, inserting the current comment
"             leader automatically.
" q         Allow formatting of comments with "gq".
" r         Automatically insert the current comment leader
"             after hitting <ENTER> in Insert Mode.
" t         Auto-wrap text using textwidth (doesn't apply to comments).
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set formatoptions=c,q,r

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Commands and functions
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Delete trailing whitespace and tabs at the end of each line
command! DeleteTrailingWs :%s/\s\+$//

" Substitute all tabs by two whitespaces
command! Untab2 :%s/\t/  /g

" Substitute all tabs by four whitespaces
command! Untab4 :%s/\t/  /g

" Switches between absolute and relative line numbers
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc

function! SelectionSearch(direction) range
  let l:saved_reg = @"
  execute "normal! vgvy"

  let l:pattern = escape(@", '\\/.*$^~[]')
  let l:pattern = substitute(l:pattern, "\n$", "", "")

  if a:direction == 'b'
    execute "normal ?" . l:pattern . "^M"
  elseif a:direction == 'f'
    execute "normal /" . l:pattern . "^M"
  elseif a:direction == 'gv'
    call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
  elseif a:direction == 'replace'
    call CmdLine("%s" . '/'. l:pattern . '/')
  endif

  let @/ = l:pattern
  let @" = l:saved_reg
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Custom keymaps
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" {cmd} {attr} {lhs} {rhs}
"
" {cmd} : of the form <?>map, <?>noremap or <?>unmap,
"         where  <?>  can be one of the following:
"
"       :   -   normal, visual, select and operator pending mode
"       :!  -   insert and command-line mode
"       :n  -   normal mode
"       :i  -   insert mode
"       :v  -   visual and select mode
"       :s  -   select mode
"       :x  -   visual mode
"       :c  -   command-line mode
"       :o  -   operator pending mode
"
" {attr} :  optional, one or more of the following
"
"       <buffer>    -   the mapping will by effective in the
"                       current buffer only
"       <silent>    -   the mapping will not be echoed in
"                       the command line
"       <expr>
"       <script>    -   the mapping will only remap charachters
"                       using mappings that were defined local
"       <unique>    -   lets the command fail if the mapping or
"                       abbreviation already exists
"       <special>   -   useful to suppress side effect when
"                       mapping with <> notation for special
"                       characters
"
" Key modifiers:
"   Control     -   <C-key>
"   Shift       -   <S-key>
"   Alt         -   <A-key> or <M-key>
"   Super       -   <T-key>
"
" Special keys:
"   <BS>           Backspace
"   <Tab>          Tab
"   <CR>           Enter
"   <Enter>        Enter
"   <Return>       Enter
"   <Esc>          Escape
"   <Space>        Space
"   <Up>           Up arrow
"   <Down>         Down arrow
"   <Left>         Left arrow
"   <Right>        Right arrow
"   <F1> - <F12>   Function keys F1 to F12
"   <Insert>       Insert
"   <Del>          Delete
"   <Home>         Home
"   <End>          End
"   <PageUp>       page-up
"   <PageDown>     page-down
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use ',' as <leader>
let mapleader = "\,"
let maplocalleader = "\<space>"

" display undo tree with <F5>
nnoremap <special> <F5> :GundoToggle<CR>

" Remove trailing whitespaces with <F8>
nnoremap <special> <F8> :DeleteTrailingWs<CR>

" Pressing * or # in visual mode searches for the current selection
vnoremap <silent> * :call SelectionSearch('b')<CR>
vnoremap <silent> # :call SelectionSearch('f')<CR>

" NERDCommenter Toggle with <C-c> in normal and visual mode
nmap <silent> <C-c> :call NERDComment(0, "toggle")<CR>
vmap <silent> <C-c> :call NERDComment(1, "toggle")<CR>

" Pressing Ctrl+N in Normal Mode will toggle the NERDTree Plugin
nnoremap <silent><special> <C-N> :NERDTreeToggle <CR>

" tab switching
nnoremap <silent><special> <tab> :tabnext<CR>
nnoremap <silent><special> <s-tab> :tabprev<CR>

" buffer switching
nnoremap <silent><special> <leader>+ :bnext<CR>
nnoremap <silent><special> <leader>- :bprevious<CR>

" Some gitgutter keybindings
nmap ggn <Plug>GitGutterNextHunk
nmap ggp <Plug>GitGutterPrevHunk



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Plugin specific settings
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vim-airline
"""""""""""""
let g:airline_theme='base16_solarized'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#ycm#enabled = 1
let g:airline#extensions#syntastic#enabled = 1

" LaTeX
"""""""
let g:tex_flavor='latex'

" CtrlP mappings and Settings
"""""""""""""""""""""""""""""
" 'c' - the directory of the current file
" 'a' - the directory of the current file unless it is a subdirectory of the cwd
" 'r' - the nearest ancestor to the current file that contains one of these
"       directories or files: .git .hg .svn .bzr _darcs
" 'w' - modifier to 'r': start search from the cwd instead of the current
"       file's directory
" 0 or '' - disable the feature
let g:ctrlp_working_path_mode="ra"

" exclude files directories
set wildignore+=*/tmp/*,*/.git/*,*/.svn/*,*/.hg/* "directories
set wildignore+=*.swp,*.zip,*.bak,*.backup "files

" ignore files in .gitignore
"let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" NERDTree
""""""""""
" close vim when the only window left open is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" nerdtree-git-plugin
"""""""""""""""""""""
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" Ultisnips
"""""""""""
let g:UltiSnipsExpandTrigger = "<c-e>"
"let g:UltiSnipsJumpForwardTrigger = "<c-j>"
"let g:UltiSnipsJumpBackwardTrigger = "<c-k>"

" indentLine
""""""""""""
let g:indentLine_concealcursor="" "necessary for conflict with vim-json

" gundo
"""""""
let g:gundo_prefer_python3 = 1
let g:gundo_width = 30
"let g:gundo_preview_height = 15


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Load project specific settings if available
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" include per-project settings
if filereadable(".project.vim")
 source .project.vim
endif