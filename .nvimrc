" Vundle
set rtp+=~/.nvim/bundle/vundle/
call vundle#rc('~/.nvim/bundle')

" Plugins
Plugin 'gmarik/vundle'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sensible'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'dterei/VimBookmarking'
Plugin 'obvious-resize'
Plugin 'Raimondi/delimitMate'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/unite-outline'
Plugin 'Shougo/neomru.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'bling/vim-airline'
Plugin 'Yggdroot/indentLine'
Plugin 'kien/rainbow_parentheses.vim'

Plugin 'freeo/vim-kalisi'
Plugin 'nielsmadan/harlequin'

" Automatically reload .vimrc when it changes.
augroup reload_vimrc " {
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

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
set colorcolumn=80
set showmode
"set textwidth=80
set wrap linebreak
let &listchars = "tab:\u00b7 ,trail:\u00b7"
set list

"Change cursor shape and colour in insert mode
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10
set t_Co=256 " 256 color mode in term

set showbreak=↪

syntax enable
filetype plugin indent on

set autoread

" ---APPEARANCE---
set background=dark
colorscheme harlequin
set cursorcolumn
set guifont=Source\ Code\ Pro\ for\ Powerline\ Regular\ 10

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
map <C-b> :wa<CR> :!xelatex %<CR>
" copy/paste
map <A-c> "+y
map <A-v> "+gP
" Move between windows with alt arrow
map <silent> <A-Up> :wincmd k<CR>
map <silent> <A-Down> :wincmd j<CR>
map <silent> <A-Left> :wincmd h<CR>
map <silent> <A-Right> :wincmd l<CR>
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
" "Whitespace
noremap <Leader>w :'<,'>StripWhitespace<CR>


"Bookmarking. These colors work best with molokai theme
hi default BookmarkHighlightLine ctermbg=lightblue guibg=#ce5c00 cterm=bold gui=bold
hi default BookmarkHighlightText ctermbg=lightblue guibg=#ce5c00 cterm=bold gui=bold
"sign define bookmark text=• linehl=BookmarkHighlightLine texthl=BookmarkHighlightText
map <silent> <S-F3> :ClearBookmark<CR>
map <silent> <F3> :ToggleBookmark<CR>

"Tagbar
map <F8> :TagbarToggle<CR>
let g:tagbar_left = 0
let g:tagbar_sort = 0

"NERDTree
noremap <F2> :Explore<CR>

"Buffer switching
noremap <C-S-PageUp> :bprev<CR>
noremap <C-S-PageDown> :bnext<CR>

"Fugitive
map <Leader>gd :Gdiff<CR>
map <Leader>gs :Gstatus<CR>
map <Leader>gc :Gcommit<CR>
map <Leader>gb :Gblame<CR>
map <Leader>dp :diffput<CR>
map <Leader>dg :diffget<CR>

"Syntastic
let g:syntastic_java_maven_executable='$HOME/.bin/mvn'
"let g:syntastic_java_javac_executable='/spgear/zeph_comp_tools/jdk1.8.0_11/bin/javac'
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
map <silent> <C-S-Up> :ObviousResizeUp<CR>
map <silent> <C-S-Down> :ObviousResizeDown<CR>
map <silent> <C-S-Left> :ObviousResizeLeft<CR>
map <silent> <C-S-Right> :ObviousResizeRight<CR>

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
let g:unite_source_history_yank_enable = 1
let g:unite_enable_start_insert = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#source('file_rec/async','sorters','sorter_rank')
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts =
  \ '-i --vimgrep --hidden --ignore ' .
  \ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
  let g:unite_source_grep_recursive_opt = ''
endif
nnoremap <leader>f :Unite -no-split -buffer-name=files file_rec/async<cr>
nnoremap <leader>y :Unite -no-split -buffer-name=yank history/yank<cr>
nnoremap <leader>b :Unite -no-split -buffer-name=buffer buffer<cr>
nnoremap <leader>r :Unite -no-split -buffer-name=recent file_mru<cr>
nnoremap <leader>o :Unite -no-split -buffer-name=outline outline<cr>
nnoremap <leader>g :UniteWithCursorWord -no-split -buffer-name=grep grep:.<cr>

"Airline
let g:airline#extensions#tabline#enabled = 1

"IndentLine
noremap <Leader>il :IndentLinesToggle<CR>
