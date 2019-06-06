" {{1 Install plugins with plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.local/share/nvim/plugged')
" A color scheme
Plug 'dracula/vim', { 'as': 'dracula' }
" Stylish statusline
Plug 'vim-airline/vim-airline'
" Distraction-free writing mode
Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
" Git integration
Plug 'airblade/vim-gitgutter' "show git-diff in sign-column (gutter)
Plug 'tpope/vim-fugitive', {'tag': '*'}
" Undotree
Plug 'mbbill/undotree'
" integrate fzf
Plug 'junegunn/fzf.vim'
" Multiple Cursors (like sublime)
Plug 'terryma/vim-multiple-cursors'
" Autocompletion
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'fgrsnau/ncm2-aspell'
Plug 'ncm2/ncm2-syntax' | Plug 'Shougo/neco-syntax'
Plug 'ncm2/ncm2-neoinclude' | Plug 'Shougo/neoinclude.vim'
Plug 'ncm2/ncm2-neosnippet' | Plug 'Shougo/neosnippet' | Plug 'Shougo/neosnippet-snippets' | Plug 'honza/vim-snippets'
Plug 'ncm2/ncm2-markdown-subscope'
Plug 'Shougo/echodoc.vim'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
"Plug 'fatih/vim-go', { 'for': 'go', 'tag': '*' }
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'ncm2/ncm2-jedi'
Plug 'ncm2/ncm2-html-subscope'
Plug 'lervag/vimtex', { 'for': 'tex'}
" Text Filtering/Alignment | Markdown
Plug 'godlygeek/tabular' | Plug 'plasticboy/vim-markdown'
" Linting 
Plug 'neomake/neomake'
" Tag management
Plug 'ludovicchabant/vim-gutentags'
" a tagbar
Plug 'majutsushi/tagbar'
" cool commenting features
Plug 'scrooloose/nerdcommenter'
" Surrounding text with elements (brackets, tags, ..)
Plug 'tpope/vim-surround'
" Autoclose stuff like brackets etc
Plug 'Townk/vim-autoclose'
" Filetree inside vim | git plugin for the filetree
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } | Plug 'Xuyuanp/nerdtree-git-plugin'
" JSON support
Plug 'elzr/vim-json', { 'for': 'json' }
call plug#end()

" {{{1 General behavior of Vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" activate filetype plugins and indent
filetype plugin indent on

" Use syntax highlighting
syntax enable

" Set colorscheme
colorscheme dracula
" Force GUI colors in terminals
set termguicolors

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

" Don't show mode in status line (visible in airline)
set noshowmode

" Show line numbers on the side, switch between relative and absolute number
set number
au InsertEnter * :set norelativenumber
au InsertLeave * :set relativenumber
set relativenumber

" Set whether a line that doesn't fit into a window is wrapped around
" at the end of the window.
set nowrap

" Make Vim wrap long lines at specified characters instead of wrapping
" at the last character in the line.
set linebreak

" Makes Vim ask for a confirmation instead of showing an error message.
set confirm

" set window sizing
set winminwidth=20
set winheight=7
set winminheight=7

" Show a vertical lign at column 80
set colorcolumn=80

" Set the maximum width of text that is being inserted without breaking
" it to a new line.
" Setting this value to '0' disables this option.
set textwidth=0

" Behaviour when splitting the window
set splitbelow
set splitright

" autocomplete commands and filepaths in the vim-cl
set wildchar=<Tab> wildmenu wildmode=full

" Show the cursor line by default
set cursorline

" Make 'word' stop at underscores. Does not affect 'Word'.
set iskeyword-=_

if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
endif

" {{{1 Scrolling properties
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set leading/trailing lines for the cursor when moving vertically.
set scrolloff=7

" Set leading/trailing columns for the cursor when moving
" horizontally.
set sidescrolloff=7

" Set the amount of columns to scroll horizontally, when the end of
" the window is reached.
set sidescroll=20

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

" Escape key alternative
inoremap jk <Esc>
inoremap kj <Esc>


" only press < and > once in normal mode indent
nnoremap < <<
nnoremap > >>

" convenient mappings for system clipboard
noremap <Leader>y "+y
noremap <Leader>p "+p

" <F2>: toggle spell checker on and off
nnoremap <special> <F2> :call ToggleSpell()<CR>
" <F3>: switch spell checker language from English to German and vice versa
nnoremap <special> <F3> :call ToggleSpellLang()<CR>
" <F6>: show/hide filetree
nnoremap <silent><special> <F6> :NERDTreeToggle<CR>
" <F7>: show/hide undo tree
nnoremap <silent><special> <F7> :UndotreeToggle<CR>
" <F8>: show/hide tagbar
nnoremap <silent><special> <F8> :TagbarToggle<CR>

" comment/uncomment with <C-c> in normal and visual mode
nmap <silent> <C-c> :call NERDComment(0, "toggle")<CR>
vmap <silent> <C-c> :call NERDComment(1, "toggle")<CR>

" Pressing * or # in visual mode searches for the current selection
vnoremap <silent> * :call SelectionSearch('b')<CR>
vnoremap <silent> # :call SelectionSearch('f')<CR>

" tab switching
nnoremap <silent><special> <tab> :bnext<CR>
nnoremap <silent><special> <s-tab> :bprev<CR>

" Git
nmap <Leader>hn <Plug>GitGutterNextHunk
nmap <Leader>hp <Plug>GitGutterPrevHunk
nmap <silent><Leader>gs :Gstatus<CR>
nmap <silent><Leader>gc :Gcommit<CR>
nmap <silent><Leader>gp :Gpush<CR>
nmap <silent><Leader>gd :Gdiff<CR>
nmap <silent><Leader>gb :Gblame<CR>
nmap <silent><Leader>gl :Commits<CR>

" fzf
nnoremap <leader>o :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap \ :Ag<CR>
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" goyo (writing mode)
nmap <silent><leader>w :Goyo<CR>

" {{{1 Plugin specific settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" {{{2 vim-airline
""""""""""""""""""
let g:enable_italic_font = 1
let g:airline_theme='dracula'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#buffer_min_count = 2
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffers_label = 'B'
let g:airline#extensions#tabline#excludes = ['bash$']
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#middle_click_preserves_windows = 1
let g:airline#extensions#tabline#tabs_label = 'T'
let g:airline#extensions#wordcount#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {
        \ 'readonly': '⛔',
        \}
endif
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab

" {{{2 goyo
"""""""""""
function! s:goyo_enter()
  set ei=InsertEnter,InsertLeave
endfunction

function! s:goyo_leave()
  set ei=
endfunction

au! User GoyoEnter nested call <SID>goyo_enter()
au! User GoyoLeave nested call <SID>goyo_leave()
" {{{2 fzf
""""""""""
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" In Neovim, you can set up fzf window using a Vim command
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '10split enew' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" exclude files directories
set wildignore+=*/tmp/*,*/.git/*,*/.svn/*,*/.hg/* "directories
set wildignore+=*.swp,*.zip,*.bak,*.backup "files

" {{{2 NERDTree
"""""""""""""""
" close neovim when the only window left open is NERDTree
au bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

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
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

" {{{2 Neomake
""""""""""""""
function! MyOnBattery()
  if (hostname() == "FFML0020")
    return readfile('/sys/class/power_supply/AC/online') == ['0']
  else
    return readfile('/sys/class/power_supply/ACAD/online') == ['0']
  endif
endfunction

if MyOnBattery()
  call neomake#configure#automake('w')
else
  call neomake#configure#automake('nw', 1000)
endif

" {{{2 Multiple Cursors
"""""""""""""""""""""""
" disable autocomplete when using multiple cursors
function! Multiple_cursors_before()
    call ncm2#lock('vim-multiple-cursors')
endfunction

function! Multiple_cursors_after()
    call ncm2#unlock('vim-multiple-cursors')
  endfunction

" {{{2 ncm2
""""""""""""
" enable ncm2 for all buffers
augroup my_cm_setup
  au!
  au BufEnter * call ncm2#enable_for_buffer()
  au Filetype tex call ncm2#register_source({
          \ 'name' : 'vimtex-cmds',
          \ 'priority': 8, 
          \ 'complete_length': -1,
          \ 'scope': ['tex'],
          \ 'matcher': {'name': 'prefix', 'key': 'word'},
          \ 'word_pattern': '\w+',
          \ 'complete_pattern': g:vimtex#re#ncm2#cmds,
          \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
          \ })
  au Filetype tex call ncm2#register_source({
          \ 'name' : 'vimtex-labels',
          \ 'priority': 8, 
          \ 'complete_length': -1,
          \ 'scope': ['tex'],
          \ 'matcher': {'name': 'combine',
          \             'matchers': [
          \               {'name': 'substr', 'key': 'word'},
          \               {'name': 'substr', 'key': 'menu'},
          \             ]},
          \ 'word_pattern': '\w+',
          \ 'complete_pattern': g:vimtex#re#ncm2#labels,
          \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
          \ })
  au Filetype tex call ncm2#register_source({
          \ 'name' : 'vimtex-files',
          \ 'priority': 8, 
          \ 'complete_length': -1,
          \ 'scope': ['tex'],
          \ 'matcher': {'name': 'combine',
          \             'matchers': [
          \               {'name': 'abbrfuzzy', 'key': 'word'},
          \               {'name': 'abbrfuzzy', 'key': 'abbr'},
          \             ]},
          \ 'word_pattern': '\w+',
          \ 'complete_pattern': g:vimtex#re#ncm2#files,
          \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
          \ })
  au Filetype tex call ncm2#register_source({
          \ 'name' : 'bibtex',
          \ 'priority': 8, 
          \ 'complete_length': -1,
          \ 'scope': ['tex'],
          \ 'matcher': {'name': 'combine',
          \             'matchers': [
          \               {'name': 'prefix', 'key': 'word'},
          \               {'name': 'abbrfuzzy', 'key': 'abbr'},
          \               {'name': 'abbrfuzzy', 'key': 'menu'},
          \             ]},
          \ 'word_pattern': '\w+',
          \ 'complete_pattern': g:vimtex#re#ncm2#bibtex,
          \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
          \ })
  au User Ncm2Plugin call ncm2#register_source({
          \ 'name' : 'css',
          \ 'priority': 9,
          \ 'subscope_enable': 1,
          \ 'scope': ['css','scss'],
          \ 'mark': 'css',
          \ 'word_pattern': '[\w\-]+',
          \ 'complete_pattern': ':\s*',
          \ 'on_complete': ['ncm2#on_complete#delay', 180,
                           \ 'ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
          \ })
augroup END


" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" restrict height of completion popup
set pumheight=20

" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
set shortmess+=c

" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <c-c> <ESC>

" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" {{{2 LanguageClient-neovim
""""""""""""""""""""""""""""
" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'go': ['gopls'],
    \ 'c': ['clangd'],
    \ 'cpp': ['clangd'],
    \ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
"nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

function SetLSPShortcuts()
  nnoremap <leader>ld :call LanguageClient#textDocument_definition()<CR>
  nnoremap <leader>lr :call LanguageClient#textDocument_rename()<CR>
  nnoremap <leader>lf :call LanguageClient#textDocument_formatting()<CR>
  nnoremap <leader>lt :call LanguageClient#textDocument_typeDefinition()<CR>
  nnoremap <leader>lx :call LanguageClient#textDocument_references()<CR>
  nnoremap <leader>la :call LanguageClient_workspace_applyEdit()<CR>
  nnoremap <leader>lc :call LanguageClient#textDocument_completion()<CR>
  nnoremap <leader>lh :call LanguageClient#textDocument_hover()<CR>
  nnoremap <leader>ls :call LanguageClient_textDocument_documentSymbol()<CR>
  nnoremap <leader>lm :call LanguageClient_contextMenu()<CR>
endfunction()

augroup LSP
  autocmd!
  autocmd FileType cpp,c call SetLSPShortcuts()
augroup END

" Always draw the signcolumn.
set signcolumn=yes

" {{{2 echodoc
""""""""""""""
set cmdheight=2
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'signature'

" {{{2 neosnippet
"""""""""""""""""
"use vim-snippets as well
let g:neosnippet#snippets_directory='~/.local/share/nvim/plugged/vim-snippets/snippets'

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

" Press enter key to trigger snippet expansion
" The parameters are the same as `:help feedkeys()`
"inoremap <silent> <expr> <CR> ncm2_neosnippet#expand_or("\<CR>", 'n')

" {{{2 Go
"""""""""
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

" {{{2 LaTeX
" """"""""""
au FileType tex nnoremap <localleader>lt :call vimtex#fzf#run()<cr>

let g:tex_flavor='latex'
let g:tex_conceal='abdmg'
let g:vimtex_syntax_minted = [
      \ {
      \   'lang' : 'c',
      \ },
      \ {
      \   'lang' : 'go',
      \ },
      \ {
      \   'lang' : 'cpp',
      \   'environments' : ['cppcode', 'cppcode_test'],
      \ },
      \ {
      \   'lang' : 'bash',
      \   'syntax' : 'sh'
      \ },
      \ {
      \   'lang' : 'yaml',
      \ },
      \ {
      \   'lang' : 'json',
      \ },
      \ {
      \   'lang' : 'python',
      \   'ignore' : [
      \     'pythonEscape',
      \     'pythonBEscape',
      \     ],
      \ }
\]

" {{{2 Markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_folding_style_pythonic = 1
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_new_list_item_indent = 0

" vim:fdm=marker
