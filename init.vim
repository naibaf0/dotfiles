" {{1 Install plugins with plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin()
" A color scheme
Plug 'chriskempson/base16-vim'
" Stylish statusline and themes
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
" Git integration
Plug 'airblade/vim-gitgutter' "show git-diff in sign-column (gutter)
Plug 'tpope/vim-fugitive'
" Undotree
Plug 'mbbill/undotree'
" Fuzzy filesearch
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Autocompletion engine
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neoinclude.vim'
Plug 'Shougo/neopairs.vim'
Plug 'Shougo/neco-syntax'
Plug 'Shougo/context_filetype.vim'
Plug 'Shougo/echodoc.vim'
Plug 'Shougo/neosnippet' | Plug 'Shougo/neosnippet-snippets' | Plug 'honza/vim-snippets'
" Golang support
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'zchee/deoplete-go', {'for': 'go', 'do': 'make' }
" Python support
Plug 'zchee/deoplete-jedi', { 'for': 'python' }
" C/C++ support
Plug 'zchee/deoplete-clang', { 'for': ['c', 'cpp'] }
" Javascript support
Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'], 'do' : 'npm install' }
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'jelera/vim-javascript-syntax', { 'for': ['javascript', 'javascript.jsx'] }
" LaTeX support
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
" Filetree inside vim | git plugin for the filetree
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } | Plug 'Xuyuanp/nerdtree-git-plugin'
" YAML support
Plug 'stephpy/vim-yaml', { 'for': 'yaml' }
" JSON support
Plug 'elzr/vim-json', { 'for': 'json' }
call plug#end()

" {{{1 General behavior of Vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set background-color
set background=dark

" Set colorspace
let base16colorspace=256

" Set colorscheme
colorscheme base16-oceanicnext

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

" Don't show mode in status line (visible in airline)
set noshowmode

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

" set window sizing
set winminwidth=20
set winheight=7
set winminheight=7

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
nnoremap <silent><special> <tab> :tabnext<CR>
nnoremap <silent><special> <s-tab> :tabprev<CR>

" Git
nmap ggn <Plug>GitGutterNextHunk
nmap ggp <Plug>GitGutterPrevHunk
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

" {{{1 Plugin specific settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" {{{2 vim-airline
""""""""""""""""""
let g:airline_theme='base16'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#wordcount#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
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

" {{{2 fzf
""""""""""
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~25%' }

" In Neovim, you can set up fzf window using a Vim command
"let g:fzf_layout = { 'window': 'enew' }
"let g:fzf_layout = { 'window': '-tabnew' }

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
autocmd! BufWritePost * Neomake

" {{{2 deoplete
"""""""""""""""
" neocomplete like
set completeopt+=noinsert
" deoplete.nvim recommend
set completeopt+=noselect
" restrict height of completion popup
set pumheight=20
" enable deoplete
let g:deoplete#enable_at_startup = 1
" Use smartcase.
let g:deoplete#enable_smart_case = 1
let g:deoplete#auto_completion_start_length = 3

let g:deoplete#sources = {}
let g:deoplete#omni#input_patterns = {}
let g:deoplete#omni#functions = {}

call deoplete#custom#source('_', 'converters',
  \ ['converter_auto_paren', 'converter_remove_overlap', 'converter_truncate_abbr', 'converter_truncate_menu'])

" Recommended key-mappings.
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> deoplete#smart_close_popup()."\<C-h>"
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function() abort
  return deoplete#close_popup() . "\<CR>"
endfunction
inoremap <expr><C-g> deoplete#undo_completion()

" close preview window after completion
autocmd CompleteDone * pclose!

" {{{2 neosnippet
"""""""""""""""""
"use vim-snippets as well
let g:neosnippet#snippets_directory='~/.config/nvim/plugged/vim-snippets/snippets'

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

" {{{2 neopairs
"""""""""""""""
let g:neopairs#enable = 1

" {{{2 Go
"""""""""
" deoplete-go
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#package_dot = 1
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#use_cache = 0
let g:deoplete#sources['go'] = ['file', 'neosnippet', 'go', 'buffer', 'syntax']
"let g:deoplete#sources#go#json_directory = '~/.cache/deoplete/go'
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
" deoplete-clang
let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib/clang/'

" {{{2 Javascript
"""""""""""""""""
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = 0  " This do disable full signature type on autocomplete
let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']
let g:deoplete#omni#input_patterns.javascript = '[^. *\t]\.\w*'
let g:deoplete#omni#functions.javascript = [
  \ 'tern#Complete',
  \ 'jspc#omni'
\]

let g:deoplete#sources['javascript.jsx'] = ['file', 'neosnippet', 'ternjs', 'buffer', 'syntax']


" {{{2 LaTeX
" """"""""""
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

" {{{2 Markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_folding_style_pythonic = 1
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_conceal = 0

" prevent vim-markdown from inserting asterisks on wrapping line. 
" https://github.com/plasticboy/vim-markdown/issues/232
" FIXME its far from perfect, since no ai seems to take place
autocmd FileType markdown 
    \ set formatoptions-=q |
    \ set formatlistpat=^\\s*\\d\\+\\.\\s\\+\\\|^\\s*\[-*+]\\s\\+

" vim:fdm=marker
