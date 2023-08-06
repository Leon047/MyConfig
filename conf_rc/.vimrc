"                           --- 𝕍 𝕚𝕞  ---


" --- Vundle settings ----------------------------------------------------------

" Set the runtime path to include Vundle and initialize
" HINT: PluginInstall / PluginUpdate / PluginClean
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'                      " let Vundle manage Vundle, required

" Code/project navigation 
Plugin 'scrooloose/nerdtree'                    " A tree explorer plugin for vim
Plugin 'Shougo/unite.vim'                       " Navigation between buffers and files
Plugin 'majutsushi/tagbar'                      " Class/module browser
Plugin 'tmhedberg/SimpylFold'                   " Code Folding

" Other 
Plugin 'vim-airline/vim-airline'                " Lean & mean status/tabline for vim that's light as air
Plugin 'vim-airline/vim-airline-themes'         " Themes for vim-airline
Plugin 'rosenfeld/conque-term'                  " Consoles as buffers
Plugin 'tpope/vim-surround'                     " Parentheses, brackets, quotes, XML tags, and more
Plugin 'Yggdroot/indentLine'
Plugin 'turbio/bracey.vim'                      " LivePreview for html, css, js (install - nodejs, npm)
Plugin 'matze/vim-move'                         " Moving text

" Snippets support 
Plugin 'garbas/vim-snipmate'                    " Snippets manager
Plugin 'MarcWeber/vim-addon-mw-utils'           " Dependencies #1
Plugin 'tomtom/tlib_vim'                        " Dependencies #2
Plugin 'honza/vim-snippets'                     " Snippets repo

" Languages support 
Plugin 'scrooloose/syntastic'                   " Syntax checking plugin for Vim
Plugin 'tpope/vim-commentary'                   " Comment stuff out
Plugin 'mitsuhiko/vim-sparkup'                  " Sparkup (XML/jinja/htlm-django/etc.) support

" Erlang 
Plugin 'jimenezrick/vimerl'                     " The Erlang plugin for Vim

" Elixir 
Plugin 'slashmili/alchemist.vim'                " Elixir support for vim

" CSS 
Plugin 'JulesWang/css.vim'                      " CSS syntax file
Plugin 'groenewege/vim-less'                    " Vim syntax for LESS (dynamic CSS)

" JavaScript 
Plugin 'pangloss/vim-javascript'                " Vastly improved Javascript indentation and syntax support in Vim
Plugin 'maksimr/vim-jsbeautify'                 " Formated javascript files by js-beautify

" TypeScript 
Plugin 'leafgarland/typescript-vim'             " Typescript Syntax

" HTML 
Plugin 'othree/html5.vim'                       " HTML5 omnicomplete and sytnax
Plugin 'idanarye/breeze.vim'                    " Html navigation like vim-easymotion, tag matching, tag highlighting and DOM navigation

" Python 
Plugin 'davidhalter/jedi-vim'                   " Awesome Python autocompletion with VIM
Plugin 'klen/python-mode'                       " Vim python-mode. PyLint, Rope, Pydoc, breakpoints from box
Plugin 'mitsuhiko/vim-jinja'                    " Jinja support for vim
Plugin 'mitsuhiko/vim-python-combined'          " *Combined Python 2/3 for Vim
Plugin 'hynek/vim-python-pep8-indent'           " *PEP8 indent
Plugin 'jmcantrell/vim-virtualenv'              " Virtualenv support in VIM
Plugin 'tshirtman/vim-cython'                   " Cython support   

" Terraform 
Plugin 'hashivim/vim-terraform'                 " Terraform syntax highlight
Plugin 'juliosueiras/vim-terraform-completion'  " Terraform auto-completion

" Docker 
Plugin 'ekalinin/Dockerfile.vim'                " Syntax for Dockerfile
" Plugin 'kkvh/vim-docker-tools'                  " Docker-tools

call vundle#end() " required
filetype on
filetype plugin on
filetype plugin indent on


" --- Plagin settings ----------------------------------------------------------

" NERDTree 
nmap <F1> <nop>                 " unmap <F1> with help
map <F1> :NERDTreeToggle<CR>    " browse the list of files in the current directory
let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', '\.class$', 'pip-log\. txt$','\.o$']
let NERDTreeShowHidden=1

" TagBar 
nmap  <F2> : TagbarToggle <CR>
let g:tagbar_autofocus = 0

" Unite 
nnoremap <F3> :Unite buffer<CR>  " browse a list of the currently opened buffers

" Aligning indents 
map <F4> gg=G <C-o><C-o>

" Debug-mode 
nnoremap <F5> :exe "ConqueTermSplit python3 " . expand("%") <CR>
let g:ConqueTerm_StartMessages = 0
let g:ConqueTerm_CloseOnEnd = 0

" Syntastic 
noremap <F6> :w<CR>:SyntasticCheck<CR>
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_enable_signs = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1

" ConqueTerm 
" run python3 scripts 
nnoremap <F7> :ConqueTermSplit python3 <CR>  

" Turbio/Bracey 
noremap <F8> :Bracey<CR>
let g:bracey_browser_command = 1
let g:bracey_server_path = 1
let g:bracey_auto_start_browser =1 
let g:bracey_refresh_on_save = 1 
let g:bracey_eval_on_save = 1
let g:bracey_auto_start_server = 0
let g:bracey_server_allow_remote_connections = 0

" SnipMate 
let g:snippets_dir = "~/.vim/bundle/vim-snippets/snippets"
let g:snipMate = { 'snippet_version' : 1 }

" Jedi-vim 
let g:jedi#show_call_signatures = 1  " show call signatures
let g:jedi#popup_on_dot = 1          " enable autocomplete on dot
let g:jedi#popup_select_first = 0    " disable first select from auto-complete

" Better :sign interface symbols 
let g:syntastic_error_symbol = 'X'
let g:syntastic_style_error_symbol = 'X'
let g:syntastic_warning_symbol = 'x'
let g:syntastic_style_warning_symbol = 'x'

" Vim-Airline 
let g:airline_theme='powerlineish'

" Yggdroot/indentLine
let g:indentLine_char = '¦'   "['|', '¦', '┆', '┊'] 
let g:indentLine_color_term = 239
let g:indentLine_color_tty_dark = 1

" Vim-Move 
let g:move_key_modifier = 'C'
vmap <C-Down> <Plug>MoveBlockDown
vmap <C-Up> <Plug>MoveBlockUp
nmap <C-Down> <Plug>MoveLineDown
nmap <C-Up> <Plug>MoveLineUp


" --- General settings ---------------------------------------------------------

set backspace=indent,eol,start

" Auto save 
autocmd CursorHold,CursorHoldI * update

" Increase story size
set history=200

" Swaps and backups                   
set noswapfile
" if has("win32") || has("win64")
"     set dir=$TMP
"     set backupdir=$TMP
" else
"     set dir=~/.vim/sessions
"     set backupdir=~/.vim/sessions
" endif

" This must happen before the syntax system is enabled
aunmenu Help.
aunmenu Window.
let no_buffers_menu=1

" Mouse support
" set mouse=a
set mousemodel=popup
set mousehide            " Hide mouse cursor when typing 

" Activate a permanent ruler and add line highlightng as well as numbers.
" Also disable the sucking pydoc preview window for the omni completion
" and highlight current line and disable the blinking cursor.
set ruler
set completeopt-=preview
set gcr=a:blinkon0
if has("gui_running")
    set cursorline
endif
set ttyfast

" Enable Syntax Colors
" in GUI mode we go with fruity and Monaco 13
" in CLI mode myterm looks better (fruity is GUI only)
tab sball
set switchbuf=useopen

" Use system clipboard
set clipboard=unnamedplus

" Customize the wildmenu
set wildmenu
set wildignore+=*.dll,*.o,*.pyc,*.bak,*.exe,*.jpg,*.jpeg,*.png,*.gif,*$py.class,*.class,*/*.dSYM/*,*.dylib
set wildmode=list:full

" Don't bell and blink
set visualbell t_vb=    " turn off error beep/flash
set noerrorbells        " turn off sound bell
set novisualbell        " turn off visual bell
set enc=utf-8           " utf-8 default encoding
set ls=2                " always show status bar
set incsearch           " incremental search
set hlsearch            " highlighted search results
set nu                  " show line numbers
set scrolloff=5         " keep some more lines for scope
set showmatch           " show matching brackets/parenthesis
set matchtime=0         " don't blink when matching

" Enable folding
set foldmethod=indent
set foldlevel=99
let g:SimpylFold_docstring_preview=1  " Preview docstring in fold text  
let g:SimpylFold_fold_import = 1      " Fold imports

" Hide some panels
set guioptions-=m   " remove menu bar
set guioptions-=T   " remove toolbar
set guioptions-=r   " remove right-hand scroll bar
set guioptions-=L   " remove left-hand scroll bar

augroup vimrc_autocmds
    autocmd!
    autocmd FileType ruby,python,javascript,c,cpp highlight Excess ctermbg=DarkGrey guibg=#c12a0f
    autocmd FileType ruby,python,javascript,c,cpp match Excess /\%80v.*/
    autocmd FileType ruby,python,javascript,c,cpp set nowrap
augroup END

" Highlight characters past column 80
set colorcolumn=80
highlight ColorColumn ctermbg=238


" --- Color Settings -----------------------------------------------------------

" Comments
hi Comment ctermfg=585 

" Autocomplete
hi Pmenu ctermbg=none ctermfg=255
hi PmenuSel ctermbg=238 ctermfg=255

" Brackets
hi MatchParen cterm=none ctermbg=238 ctermfg=none

" CursorLine
set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey40
hi Visual  ctermbg=238 guibg=Grey40 gui=none


" --- Python-mode settings -----------------------------------------------------

let g:pymode_rope = 0

" Documentation
let g:pymode_doc = 0
let g:pymode_doc_key = 'K'

" Linting
let g:pymode_lint = 1
let g:pymode_lint_checkers = ['pylint', 'pep8']
let g:pymode_lint_cwindow = 1
let g:pymode_lint_ignore="E501,W601,C0110,C0111"
let g:pymode_lint_write = 0

" Support virtualenv
let g:pymode_virtualenv = 1
let g:virtualenv_directory = '~/.virtualenvs'
let g:virtualenv_stl_format = '[Py3]'

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

" Syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0

" Get possibility to run Python code
let g:pymode_run = 0

" Other options
let g:pymode_options_colorcolumn = 0
if has("gui_running")
    let g:airline_powerline_fonts = 1
else
    let g:airline_powerline_fonts = 0
endif

let python_highlight_all=1
let python_highlight_exceptions=0
let python_highlight_builtins=0
let python_slow_sync=1
let g:syntastic_python_checkers = ['flake8', 'python']
let g:syntastic_python_flake8_args='--ignore=E121,E128,E711,E301,E261,E241,E124,E126,E721
\ --max-line-length=80'
autocmd FileType python setlocal completeopt-=preview
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8
\ formatoptions+=croq softtabstop=4 smartindent
\ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
autocmd FileType pyrex setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4 
\ smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with


" --- Languages support --------------------------------------------------------

" C/C++/C# 
autocmd FileType c setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType cpp setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType objc setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType cs setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType c setlocal commentstring=/*\ %s\ */
autocmd FileType cpp,cs,objc setlocal commentstring=//\ %s
let c_no_curly_error=1
let g:syntastic_cpp_include_dirs = ['include', '../include']
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_c_include_dirs = ['include', '../include']
let g:syntastic_c_compiler = 'clang'

" JavaScript 
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd BufNewFile,BufRead *.json setlocal ft=javascript
autocmd FileType javascript setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript setlocal commentstring=//\ %s
autocmd FileType javascript let b:javascript_fold = 0
let javascript_enable_domhtmlcss=1
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_javascript_jshint_args='--config ~/.vim/extern-cfg/jshint.json'

" TypeScript 
let g:syntastic_typescript_checkers = []
autocmd BufNewFile,BufRead *.ts setlocal ft=typescript
autocmd FileType typescript setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" JSON 
autocmd FileType json setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" HTML 
let html_no_rendering=1
let g:syntastic_html_checkers = []
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType html setlocal expandtab shiftwidth=2 tabstop=4 softtabstop=2
autocmd FileType html setlocal commentstring=<!--\ %s\ -->

" Jinja 
autocmd Filetype htmljinja setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd Filetype htmldjango setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd Filetype jinja setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" CSS 
filetype plugin on
set omnifunc=syntaxcomplete#Complete
autocmd FileType css setlocal commentstring=/*\ %s\ */
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType css setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" SASS
autocmd FileType sass setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" YAML 
autocmd BufNewFile,BufRead *.sls setlocal ft=yaml
autocmd FileType yaml setlocal expandtab shiftwidth=2 tabstop=4 softtabstop=2

" Terraform 
let g:syntastic_terraform_tffilter_plan = 1
let g:terraform_completion_keys = 0
let g:terraform_registry_module_completion = 0

" Cmake support 
autocmd BufNewFile,BufRead CMakeLists.txt setlocal ft=cmake

" TXT 
autocmd BufRead,BufNewFile *.txt set filetype=txt
autocmd FileType txt setlocal expandtab shiftwidth=2 tabstop=4 softtabstop=2

" MD 
autocmd BufRead,BufNewFile *.md set filetype=md
autocmd FileType md setlocal expandtab shiftwidth=2 tabstop=4 softtabstop=2

" unix.conf 
autocmd BufRead,BufNewFile *.conf set filetype=conf
autocmd FileType conf setlocal expandtab shiftwidth=2 tabstop=4 softtabstop=2

" Vim
autocmd FileType vim setlocal expandtab shiftwidth=2 tabstop=4 softtabstop=2


" --- User hotkeys -------------------------------------------------------------

" Easier moving of code blocks
vnoremap < <gv " Shift+> keys
vnoremap > >gv " Shift+< keys

" Backspace in Visual mode deletes selection
vnoremap <BS> d

" CTRL-Z is Undo
noremap <C-z> u
inoremap <C-z> <C-O>u

" CTRL-Y is Redo
noremap <C-y> <C-R> 
inoremap <C-y> <C-O><C-R>

" CTRL-A is Select all
" noremap <C-a> gggH<C-O>G
" inoremap <C-a> <C-O>gg<C-O>gH<C-O>G
" cnoremap <C-a> <C-C>gggH<C-O>G
" onoremap <C-a> <C-C>gggH<C-O>G
" snoremap <C-a> <C-C>gggH<C-O>G
" xnoremap <C-a> <C-C>ggVG

" Use CTRL-S for saving, also in Insert mode
" noremap <C-S> :update<CR>
" vnoremap <C-S> <C-C>:update<CR>
" inoremap <C-S> <C-O>:update<CR>

" Settings for buffers
map <C-q> :bd!<CR>         " close current buffer, CTRL-q
noremap <C-Right> :bn<CR>  " move to next buffer, CTRL-Right
noremap <C-Left> :bp<CR>   " move to previous buffer, CTRL-Left

" Easier split navigations
nnoremap <silent> <C-j> <c-w>h  " move to the right subwindows, CTRL-j
nnoremap <silent> <C-l> <c-w>l  " move to the upper subwindow, CTRL-i
nnoremap <silent> <C-i> <c-w>k  " move to the lower subwindow, CTRL-k
nnoremap <silent> <C-k> <c-w>j  " move to the left subwindow, CTRL-l

" Split managment
map <silent> <A-s> :split<CR>   " Split horizontal, ALT-s
map <silent> <A-v> :vsplit<CR>  " Split vertical, ALV-v

" Easier change size for splitted window
map <silent> <A-j> <C-w>>  " Increase size of the vertical split, ALT-j
map <silent> <A-i> <C-W>+  " Increase size of the horizontal split, ALT-i
map <silent> <A-k> <C-W>-  " Decrease size of the horizontal split, ALT-k
map <silent> <A-l> <C-w><  " Decrease size of the vertical split, ALT-l

" Python code check on PEP8
autocmd FileType python map <buffer> <leader>8 :PymodeLint<CR>

" Activate autocomplete at <Ctrl+Space>
inoremap <C-space> <C-x><C-o>
