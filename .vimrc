" ---------Plugin settings--------------
" Pathogen load
filetype off


call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on

" Auto fix vim python paths if virtualenv enabled
let g:pymode_virtualenv = 1

" Load pylint code plugin
let g:pymode_lint = 1

" Switch pylint, pyflakes, pep8, mccabe code-checkers
" Can have multiply values "pep8,pyflakes,mcccabe"
let g:pymode_lint_checker = "pep8,mccabe"

" Skip errors and warnings
" E.g. "E501,W002", "E2,W" (Skip all Warnings and Errors startswith E2) and etc
" let g:pymode_lint_ignore = "E501"

" Select errors and warnings
" E.g. "E4,W"
"let g:pymode_lint_select = ""

" Run linter on the fly
let g:pymode_lint_onfly = 1

" Pylint configuration file
" If file not found use 'pylintrc' from python-mode plugin directory
" let g:pymode_lint_config = "$HOME/.pylintrc"

" Check code every save
let g:pymode_lint_write = 1 

" Additional python paths
let g:pymode_paths = []

" Autoremove unused whitespaces
let g:pymode_utils_whitespaces = 1

" Enable pymode indentation
let g:pymode_indent = 1

" Set default pymode python options
let g:pymode_options = 1

" Auto open cwindow if errors is found
let g:pymode_lint_cwindow = 1

" Show error message if cursor placed at the error line
let g:pymode_lint_message = 1

" Auto jump on first error
let g:pymode_lint_jump = 0

" Hold cursor in current window
" when quickfix is open
let g:pymode_lint_hold = 1

" Place error signs
let g:pymode_lint_signs = 1

" Maximum allowed mccabe complexity
let g:pymode_lint_mccabe_complexity = 8

" Minimal height of pylint error window
let g:pymode_lint_minheight = 3

" Maximal height of pylint error window
let g:pymode_lint_maxheight = 6

" Enable pymode's custom syntax highlighting
let g:pymode_syntax = 1

" Enable all python highlightings
let g:pymode_syntax_all = 1

" Highlight "print" as function
let g:pymode_syntax_print_as_function = 1

" Highlight indentation errors
let g:pymode_syntax_indent_errors = g:pymode_syntax_all

" Highlight trailing spaces
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Highlight string formatting
let g:pymode_syntax_string_formatting = g:pymode_syntax_all

" Highlight str.format syntax
let g:pymode_syntax_string_format = g:pymode_syntax_all

" Highlight string.Template syntax
let g:pymode_syntax_string_templates = g:pymode_syntax_all

" Highlight doc-tests
let g:pymode_syntax_doctests = g:pymode_syntax_all

" Highlight builtin objects (__doc__, self, etc)
let g:pymode_syntax_builtin_objs = g:pymode_syntax_all

" Highlight builtin functions
let g:pymode_syntax_builtin_funcs = g:pymode_syntax_all

" Highlight exceptions
let g:pymode_syntax_highlight_exceptions = g:pymode_syntax_all

" For fast machines
let g:pymode_syntax_slow_sync = 0

" ------------Vim Settisgs ---------------
syntax on
filetype plugin indent on


" Because screw underlining HTML <a>'s
hi link htmlLink NONE

set nobackup
set noshowmatch
let loaded_matchparen = 1

set number
set numberwidth=4

set encoding=utf-8

" Because <TAB>'s are no fun
set ts=4
set shiftwidth=2
set softtabstop=2
set expandtab

set autoindent
set copyindent

" Send more characters for redraws
set ttyfast

" " Enable mouse use in all modes
set mouse=a

" " Set this to the name of your terminal that supports mouse codes.
" " Must be one of: xterm, xterm2, netterm, dec, jsbterm, pterm
set ttymouse=xterm2
set clipboard=unnamedplus
au InsertLeave * set nopaste

" Vim bindings only, not vi compatible
set nocompatible

" Draws line at 80
"if exists('+colorcolumn')
"  set colorcolumn=81
"else
"  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
"endif

"set background=dark
"colorscheme wombat256mod 
hi Normal ctermbg=none
hi LineNr ctermbg=none
hi NonText ctermbg=none
hi SignColumn ctermbg=none ctermfg=cyan
hi LineNr ctermfg=yellow

"-------------Keybinds-----------------------

augroup AutoReloadVimRC
  au!
  " automatically reload vimrc when it's saved
  au BufWritePost $MYVIMRC so $MYVIMRC
augroup END

" This beauty remembers where you were the last time you edited the file, and
" returns to the same position.
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

autocmd FileType python set omnifunc=pythoncomplete#Complete

" Disable paste when leaving insert mode
au InsertLeave * set nopaste

" Frustration fix
:command -bang Q quit<bang>

:let mapleader = "'"

set pastetoggle=<F2>

map <leader>b Oimport ipdb; ipdb.set_trace() #breakpoint<C-c>
set foldlevelstart=20
set noswapfile

" Change cursor shape in insert mode
" Changing cursor shape per mode
" 1 or 0 -> blinking block
" 2 -> solid block
" 3 -> blinking underscore
" 4 -> solid underscore
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
