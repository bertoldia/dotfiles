call plug#begin('~/.config/nvim/bundle')
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-sensible'
  "Plug 'Valloric/YouCompleteMe'
  Plug 'Valloric/ListToggle'
  Plug 'scrooloose/nerdcommenter'
  Plug 'scrooloose/nerdtree'
  "Plug 'scrooloose/syntastic'
  Plug 'benekastah/neomake'
  Plug 'majutsushi/tagbar' | Plug 'bling/vim-airline'
  Plug 'Lokaltog/vim-easymotion'
  Plug 'MattesGroeger/vim-bookmarks'
  Plug 'obvious-resize'
  Plug 'Raimondi/delimitMate'
  Plug 'airblade/vim-gitgutter'
  Plug 'ntpeters/vim-better-whitespace'
  "Plug 'janko-m/vim-test'
  Plug 'Yggdroot/indentLine'
  "Plug 'dart-lang/dart-vim-plugin', {'for': 'dart'}
  "Plug 'miyakogi/vim-dartanalyzer', {'for': 'dart'}
  "Plug 'sentientmachine/erics_vim_syntax_and_color_highlighting', {'for': 'java'}
  "Plug 'artur-shaik/vim-javacomplete2', {'for': 'java'}
  "Plug 'aklt/plantuml-syntax', {'for': 'plantuml'}
  Plug 'fatih/vim-go', {'for': 'go'}
  Plug 'Shougo/denite.nvim', {'do': ':UpdateRemotePlugins'}
  Plug 'Shougo/neomru.vim'
  Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
  Plug 'zchee/deoplete-go', {'do': 'make', 'for': 'go'}
  Plug 'c0r73x/neotags.nvim'


  Plug 'molokai'
  Plug 'monokai'
  Plug 'darkspectrum'
  Plug 'mkarmona/colorsbox'
  Plug 'freeo/vim-kalisi'
  Plug 'blerins/flattown'
  Plug 'nielsmadan/harlequin'
call plug#end()

" ---OPTIONS---

" allow backspacing over everything in insert mode
" backspace and cursor keys wrap to previous/next line
set whichwrap+=<,>,[,]
set smartindent
set history=100                 " keep 50 lines of command line history
set hlsearch
"set autochdir                   " make cwd the current buffer's home
set hidden                      " When I close a tab don't remove the buffer
let g:clipbrdDefaultReg = '+'
set grepprg=grep\ -nH\ $*
set expandtab                   " make tabs spaces
set shiftwidth=2                " for auto and manual indent
set tabstop=2                   " pressing tab inserts 2 spaces
set nu                          " line number
"Folding
set foldmethod=syntax
set foldcolumn=3
"set foldclose=all
set foldlevel=1
set foldnestmax=5
set spl=en spell                " spell-checklanguage
set spell                       " spell-check on
set switchbuf=usetab,newtab     " Buffer control options
" Cool tab completion stuff
set wildmode=list:full
set mouse=a                     " Enable mouse support in console
set ignorecase                 " Ignoring case is a fun trick
set smartcase                   " And so is Artificial Intelligence!
set tags=./tags;/               " search for a tags file staring at current file's wd and going up until one is found
set cst                         "to select tag when there are multiple matches
" highlight current line and column, and set the red line over there ->
set cursorline
set cursorcolumn
set colorcolumn=80
set showmode
set textwidth=80
set wrap linebreak
let &listchars = "tab:\u00b7 ,trail:\u00b7"
set list
set title
set completeopt=menuone,longest,preview

"Change cursor shape and colour in insert mode
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10

set showbreak=↪

syntax enable
filetype plugin indent on

" ---APPEARANCE---
set background=dark
colorscheme kalisi

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvs<C-R>=current_reg<CR><Esc>

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  autocmd Filetype,BufReadPost,BufNewFile java setlocal shiftwidth=2 tabstop=2 colorcolumn=100 textwidth=100
  autocmd Filetype go set nolist

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost !gitcommit
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif
endif

" Automatically reload .nvimrc when it changes.
augroup reload_vimrc " {
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

"re-mappings
" Don't use Ex mode, use Q for formatting
map Q gq
map <C-n> :tabnew<CR>
map <C-A-v> :vsplit<CR>
noremap <C-A-l> :wa<CR> :!rubber --force --inplace -pdf %<CR>
noremap <C-A-b> :wa<CR> :!pdflatex %<CR>
noremap <C-A-h> :w<CR> :!$HOME/.bin/mkd2html "%"<CR>
map <C-b> :w<CR> :!pdflatex %<CR>
" copy/paste
map <A-c> "+y
map <A-v> "+gP
" Move between M-windows with alt arrow
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>
nmap <silent> <C-S-t> :tab sball<CR>


"map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <C-\> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
map <C-W> :bd <CR>

" misspellings
:iabbrev teh the
:iabbrev ans and
:syntax keyword WordError teh
:syntax keyword WordError ans

" Select all
noremap <C-a> ggVG

" >>>>>>>>>>>>>>>>>>>> Plugins Behaviour Modifications <<<<<<<<<<<<<<<<<<<<<<<
" Whitespace
noremap <Leader>w :'<,'>StripWhitespace<CR>

"Tagbar
map <F8> :TagbarToggle<CR>
let g:tagbar_left = 0
let g:tagbar_sort = 0

"NERDTree
noremap <S-F2> :NERDTreeToggle<CR>
noremap <F2> :Explore<CR>

"Buffer switching
noremap <C-S-PageUp> :bprev<CR>
noremap <C-S-PageDown> :bnext<CR>

noremap <C-PageUp> :tabprev<CR>
noremap <C-PageDown> :tabnext<CR>

"Fugitive
map <Leader>gd :Gdiff<CR>
map <Leader>gs :Gstatus<CR>
map <Leader>gc :Gcommit<CR>
map <Leader>gb :Gblame<CR>
map <Leader>dp :diffput<CR>
map <Leader>dg :diffget<CR>

"Syntastic
let g:syntastic_java_checkers=['javac', 'checkstyle']
let g:syntastic_javascript_checkers=['jshint', 'jslint', 'jsl']
let g:syntastic_python_checkers=['flake8', 'python']
let g:syntastic_warning_symbol='!!'
let g:syntastic_error_symbol='✘✘'
let g:syntastic_aggregate_errors = 1
let g:syntastic_always_populate_loc_list = 1
nmap <silent> [l :lprev<CR>
nmap <silent> ]l :lnext<CR>

"obvious-resize
nmap <silent> <C-S-Up> :ObviousResizeUp<CR>
nmap <silent> <C-S-Down> :ObviousResizeDown<CR>
nmap <silent> <C-S-Left> :ObviousResizeLeft<CR>
nmap <silent> <C-S-Right> :ObviousResizeRight<CR>

"YCM
"let g:ycm_min_num_of_chars_for_completion = 3
let g:ycm_min_num_identifier_candidate_chars = 3
let g:ycm_warning_symbol='!!'
let g:ycm_error_symbol='✘✘'
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_tags_files = 0
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_confirm_extra_conf = 0
set completeopt-=preview

"Unite
"let g:unite_source_history_yank_enable = 1
"let g:unite_enable_start_insert = 1
"call unite#filters#matcher_default#use(['matcher_fuzzy'])
"call unite#filters#sorter_default#use(['sorter_rank'])
"call unite#custom#source('file_rec/async','sorters','sorter_rank')
"if executable('ag')
  "let g:unite_source_grep_command = 'ag'
  "let g:unite_source_grep_default_opts =
  "\ '-i --vimgrep --hidden --ignore ' .
  "\ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
  "let g:unite_source_grep_recursive_opt = ''
"endif

"Denite
"call denite#custom#var('grep', 'command', ['ag'])
"call denite#custom#var('grep', 'recursive_opts', [])
"call denite#custom#var('grep', 'default_opts',
  "\ ['-i', '--vimgrep', '--hidden',
  "\ '--ignore', '.git', '--ignore', '*.swp'])
"call denite#custom#var('file_rec', 'command',
  "\ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
call denite#custom#map('insert', '<Down>', 'move_to_next_line')
call denite#custom#map('normal', '<Down>', 'move_to_next_line')
call denite#custom#map('insert', '<Up>', 'move_to_prev_line')
call denite#custom#map('normal', '<Up>', 'move_to_prev_line')
call denite#custom#map('insert', '<Esc>', 'enter_mode:normal')
nnoremap <leader>f :Denite -buffer-name=files file_rec<cr>
nnoremap <leader>b :Denite -buffer-name=buffer buffer<cr>
nnoremap <leader>r :Denite -buffer-name=recent file_mru<cr>
nnoremap <leader>o :Denite -buffer-name=outline outline<cr>
nnoremap <leader>g :DeniteCursorWord -buffer-name=grep grep:.<cr><cr>



"IndentLines
noremap <Leader>il :IndentLinesToggle<CR>

" vim-test
let test#strategy = "neovim"
nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ts :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tv :TestVisit<CR>
let g:test#java#maventest#file_pattern = '\v^.*[Tt]ests=(Suite)=\.java$'
let test#java#maventest#executable = 'mvn compiler:compile compiler:testCompile surefire:test'

" javacomplete2
autocmd FileType java setlocal omnifunc=javacomplete#Complete

" neomake
autocmd! BufWritePost * Neomake
let g:neomake_java_checkstyle_maker = {
    \ 'args': ['-c', '/opt/checkstyle/sun_checks.xml'],
    \ 'errorformat': '%f:%l:\ %m,%f:%l:%v:\ %m,%-G%.%#',
    \ }
"let g:neomake_java_enabled_makers = ['javac', 'checkstyle']
let g:neomake_go_enabled_makers = ['go', 'govet']

" deoplete
let g:deoplete#enable_at_startup = 1
"let g:deoplete#sources#go#gocode_binary = '$GOBIN/gocode'
let g:deoplete#sources#go#gocode_binary = '/local/home/bertoa/.go/bin/gocode'

" vim-go
let g:go_oracle_scope="gitlab.spgear.lab.emc.com/dolphin/go-mongo-proxy"
" open test/implementation file in a vsplit instead of the same window
let g:go_alternate_mode = "vsplit"
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_term_enabled = 1

"neotags
let g:neotags_enabled = 1
let g:neotags_appendpath = 0
let g:neotags_ctags_bin = 'ag -g "" '. getcwd() .' | ctags'
let g:neotags_ctags_args = [
            \ '-L -',
            \ '--fields=+l',
            \ '--c-kinds=+p',
            \ '--c++-kinds=+p',
            \ '--sort=no',
            \ '--extra=+q'
            \ ]
