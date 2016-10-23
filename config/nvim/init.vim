" {{{1 Install plugins with plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin()
" A color scheme
Plug 'altercation/vim-colors-solarized'
" Stylish statusline and themes
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
" show git-diff in the sign column
Plug 'airblade/vim-gitgutter'
" Undotree
Plug 'mbbill/undotree'
" Fuzzy filesearch
Plug 'ctrlpvim/ctrlp.vim'
" Autocompletion engine
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neoinclude.vim'
Plug 'Shougo/neco-syntax'
Plug 'Shougo/context_filetype.vim'
Plug 'Shougo/neosnippet' | Plug 'Shougo/neosnippet-snippets'
" Golang support
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'zchee/deoplete-go', {'for': 'go', 'do': 'make' }
" Python support
Plug 'zchee/deoplete-jedi', { 'for': 'python' }
" C/C++ support
Plug 'Rip-Rip/clang_complete', { 'for': ['c', 'cpp'] }
" Javascript support
Plug 'carlitux/deoplete-ternjs', { 'for': 'javascript' }
" vim support for LaTeX
Plug 'lervag/vimtex', { 'for': 'tex'}
" a tagbar
Plug 'majutsushi/tagbar'
" cool commenting features
Plug 'scrooloose/nerdcommenter'
" Filetree inside vim | git plugin for the filetree
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } | Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Shougo/neopairs.vim'
" faster yaml syntax
Plug 'stephpy/vim-yaml', { 'for': 'yaml' }
" json support
Plug 'elzr/vim-json', { 'for': 'json' }
" javascript syntax
Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }
" syntax for javascript libraries
Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'javascript' }
call plug#end()

" {{{1 General behavior of Vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use vim with light color theme
set background=dark

" Use solarized theme
colorscheme solarized

" activate filetype plugins and indent
filetype plugin indent on

" Use syntax highlighting
syntax enable

" Set the standard encoding
set encoding=utf8

" Set the height of the command bar
set cmdheight=1

" Always show the status line
set laststatus=2

" Always show tab line
set showtabline=1

" Show (partial) command in status line
set showcmd

" Show line numbers on the side, switch between relative and absolute number
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

" Makes Vim ask for a confirmation instead of showing an error message.
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

" Behaviour when splitting the window
set splitbelow
set splitright

" autocomplete commands and filepaths in the vim-cl
set wildchar=<Tab> wildmenu wildmode=full

" Show the cursor line by default
set cursorline

" Make 'word' stop at underscores. Does not affect 'Word'.
set iskeyword-=_

" {{{1 Scrolling properties
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set leading/trailing lines for the cursor when moving vertically.
set scrolloff=7

" Set leading/trailing columns for the cursor when moving
" horizontally.
set sidescrolloff=20

" Set the amount of columns to scroll horizontally, when the end of
" the window is reached.
set sidescroll=35

" {{{1 Indentation rules
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

" {{{1 Search properties
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Allow 'search next' to jump back to the beginning of the file if the
" end was reached (equivalent for 'search previous').
set wrapscan

" Set to highlight matches for previous search patterns.
set hlsearch

" While typing a search command, immediately show where the so far
" typed pattern matches.
set incsearch

" Ignore the case when searching
set ignorecase

" When searching, try to be smart about cases
set smartcase

" {{{1 User-defined folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Define where to create folds
set fdm=manual

" Set the number of screen line above which a fold can be displayed closed.
set fml=3

" Define the maximum nesting of folds (for the 'indent' and 'syntax' methods).
set fdn=3

" Specify the text displayed for a closed fold.
"set fdt=

" {{{1 Spell checking
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! ToggleSpell()
  if (&spell == 1)
    setlocal nospell
    echo "spell: off"
  else
    setlocal spell
    echo "spell: on"
  endif
endfunction

" Set languages for spell checking
set spelllang=en_gb

function! ToggleSpellLang()
  if (&spelllang == 'en_gb')
    set spelllang=de_de
    echo "spelllang: DE"
  else
    set spelllang=en_gb
    echo "spelllang: EN"
  endif
endfunction

" {{{1 Vim auto save
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup save
  au!
  au FocusLost * wall
augroup END
set nohidden
set nobackup
set noswapfile
set nowritebackup
set autoread
set autowrite
set autowriteall

" {{{1 Persistent undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set undodir=$HOME/.config/nvim/undo
set undofile
set undolevels=500

" {{{1 Format options
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

" {{{1 Commands and functions
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

" {{{1 Custom keymaps
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

" escape from terminal :)
tnoremap <leader><Esc> <C-\><C-n>

" only press < and > once in normal mode indent
nnoremap < <<
nnoremap > >>

" convenient mappings for system clipboard
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

" <F2>: toggle spell checker on and off
nnoremap <special> <F2> :call ToggleSpell()<CR>
" <F3>: switch spell checker language from English to German and vice versa
nnoremap <special> <F3> :call ToggleSpellLang()<CR>
" <F6>: show/hide filetree
nnoremap <special> <F6> :NERDTreeToggle<CR>
" <F7>: show/hide undo tree
nnoremap <special> <F7> :UndotreeToggle<CR>
" <F8>: show/hide tagbar
nnoremap <special> <F8> :TagbarToggle<CR>

" comment/uncomment with <C-c> in normal and visual mode
nmap <silent> <C-c> :call NERDComment(0, "toggle")<CR>
vmap <silent> <C-c> :call NERDComment(1, "toggle")<CR>

" Pressing * or # in visual mode searches for the current selection
vnoremap <silent> * :call SelectionSearch('b')<CR>
vnoremap <silent> # :call SelectionSearch('f')<CR>

" tab switching
nnoremap <silent><special> <tab> :tabnext<CR>
nnoremap <silent><special> <s-tab> :tabprev<CR>

" buffer switching
nnoremap <silent><special> <leader>+ :bnext<CR>
nnoremap <silent><special> <leader>- :bprevious<CR>

" Some gitgutter keybindings
nmap ggn <Plug>GitGutterNextHunk
nmap ggp <Plug>GitGutterPrevHunk

" {{{1 Plugin specific settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" {{{2 vim-airline
""""""""""""""""""
let g:airline_theme='base16_solarized'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#branch#enabled = 1

" {{{2 CtrlP
""""""""""""
" 'c' - the directory of the current file
" 'a' - the directory of the current file unless it is a subdirectory of the cwd
" 'r' - the nearest ancestor to the current file that contains one of these
"       directories or files: .git .hg .svn .bzr _darcs
" 'w' - modifier to 'r': start search from the cwd instead of the current
"       file's directory
" 0 or '' - disable the feature
let g:ctrlp_working_path_mode="ra"

if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" exclude files directories
set wildignore+=*/tmp/*,*/.git/*,*/.svn/*,*/.hg/* "directories
set wildignore+=*.swp,*.zip,*.bak,*.backup "files

" ignore files in .gitignore
"let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" {{{2 NERDTree
"""""""""""""""
" close neovim when the only window left open is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" {{{2 nerdtree-git-plugin
""""""""""""""""""""""""""
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

" {{{2 Tagbar
"""""""""""""
let g:tagbar_autoclose = 1

" {{{2 deoplete
"""""""""""""""
" neocomplete like
set completeopt+=noinsert
" deoplete.nvim recommend
set completeopt+=noselect
" enable deoplete
let g:deoplete#enable_at_startup = 1
" Use smartcase.
let g:deoplete#enable_smart_case = 1
let g:deoplete#auto_completion_start_length = 3
" Maximum Number of candidates shown
let g:deoplete#max_list = 40

" Recommended key-mappings.
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> deoplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-g> deoplete#undo_completion()

" close preview window after completion
autocmd CompleteDone * pclose!

" {{{2 neosnippet
"""""""""""""""""
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
"smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" {{{2 Go
"""""""""
" deoplete-go
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#use_cache = 1
"let g:deoplete#sources#go#json_directory = '/path/to/data_dir'
" vim-go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_fmt_autosave = 0
au FileType go nmap <localleader>i <Plug>(go-info)
au FileType go nmap <localleader>d <Plug>(go-def)
au FileType go nmap <localleader>gd <Plug>(go-doc)
au FileType go nmap <localleader>r <Plug>(go-run)
au FileType go nmap <localleader>b <Plug>(go-build)
au FileType go nmap <localleader>t <Plug>(go-test)
au FileType go nmap <localleader>c <Plug>(go-coverage)
au FileType go nmap <localleader>ds <Plug>(go-def-split)
au FileType go nmap <localleader>e <Plug>(go-rename)
au FileType go nmap <localleader>rt <Plug>(go-run-tab)

" {{{2 C/C++
""""""""""""
	let g:clang_complete_auto = 1
	let g:clang_auto_select = 0
	let g:clang_omnicppcomplete_compliance = 0
	let g:clang_make_default_keymappings = 0
  "let g:clang_use_library = 1

" {{{2 Javascript
"""""""""""""""""
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = 0  " This do disable full signature type on autocomplete

" {{{2 LaTeX
" """"""""""
if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#omni#input_patterns.tex = '\\(?:'
      \ .  '\w*cite\w*(?:\s*\[[^]]*\]){0,2}\s*{[^}]*'
      \ . '|\w*ref(?:\s*\{[^}]*|range\s*\{[^,}]*(?:}{)?)'
      \ . '|hyperref\s*\[[^]]*'
      \ . '|includegraphics\*?(?:\s*\[[^]]*\]){0,2}\s*\{[^}]*'
      \ . '|(?:include(?:only)?|input)\s*\{[^}]*'
      \ . '|\w*(gls|Gls|GLS)(pl)?\w*(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
      \ . '|includepdf(\s*\[[^]]*\])?\s*\{[^}]*'
      \ . '|includestandalone(\s*\[[^]]*\])?\s*\{[^}]*'
\ .')'

let g:tex_flavor='latex'
let g:tex_conceal='abdmg'

" {{{1 Load project specific settings if available
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" include per-project settings
if filereadable(".project.vim")
 source .project.vim
endif
" vim:fdm=marker
