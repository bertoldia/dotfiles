set nocompatible
filetype off
call plug#begin('~/.vim/bundle')
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-sensible'
  Plug 'Valloric/ListToggle'
  Plug 'scrooloose/nerdcommenter'
  Plug 'scrooloose/nerdtree'
  Plug 'majutsushi/tagbar'
  Plug 'bling/vim-airline'
  Plug 'Lokaltog/vim-easymotion'
  Plug 'MattesGroeger/vim-bookmarks'
  Plug 'roman/golden-ratio'
  Plug 'Raimondi/delimitMate'
  Plug 'airblade/vim-gitgutter'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'janko-m/vim-test'
  Plug 'Yggdroot/indentLine'
  " Completion
  Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
  " Static analysis
  Plug 'w0rp/ale'

  " Fuzzy finding
  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'

  " Languages
  " Java
  Plug 'sentientmachine/erics_vim_syntax_and_color_highlighting', {'for': 'java'}
  Plug 'artur-shaik/vim-javacomplete2', {'for': 'java'}
  " Go
  Plug 'fatih/vim-go', {'for': 'go', 'do': ':GoInstallBinaries' }
  " Rust
  Plug 'rust-lang/rust.vim', {'for': 'rust'}
  "Javascript
  Plug 'pangloss/vim-javascript', {'for': ['javascript', 'javascript.jsx']}
  Plug 'mxw/vim-jsx', {'for': 'javascript.jsx'}

  " Colors
  Plug 'morhetz/gruvbox'
  Plug 'ajmwagar/vim-deus'
  Plug 'felipesousa/rupza'
  Plug 'rdavison/Libertine'

  " Misc
  Plug 'xolox/vim-notes' | Plug 'xolox/vim-misc'
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
let g:clipbrdDefaultReg='+'
set grepprg=grep\ -nH\ $*
set expandtab                   " make tabs spaces
set shiftwidth=4                " for auto and manual indent
set tabstop=4                   " pressing tab inserts 2 spaces
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
let &listchars="tab:\u00b7 ,trail:\u00b7"
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
if has("gui_running")
  set guifont=Source\ Code\ Pro\ Regular\ 10
  set guioptions-=T " hide toolbar
  set guioptions-=m " hide menubar
  set guitablabel=%!expand(\"\%:t\")
endif

colorscheme deus

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg=@"<CR>gvs<C-R>=current_reg<CR><Esc>

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  autocmd Filetype,BufReadPost,BufNewFile java setlocal colorcolumn=100 textwidth=100
  autocmd Filetype go set nolist

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost !gitcommit
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif
endif

" Automatically reload .vimrc when it changes.
augroup reload_vimrc " {
  autocmd! BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

"re-mappings
" Don't use Ex mode, use Q for formatting
map Q gq
map <C-n> :tabnew<CR>
map <C-A-v> :vsplit<CR>
noremap <C-A-l> :wa<CR> :!rubber --force --inplace -pdf %<CR>
noremap <C-A-b> :wa<CR> :!pdflatex %<CR>
noremap <C-A-h> :w<CR> :!$HOME/.bin/mkd2html "%"<CR>
map <C-b> :w<CR> :!xelatex %<CR>
" copy/paste
map <A-c> "+y
map <A-v> "+gP

" Buffer, tab and viewport movement
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>
nmap <silent> <C-PageUp> :tabprev<CR>
nmap <silent> <C-PageDown> :tabnext<CR>
nmap <C-S-PageUp> :bprev<CR>
nmap <C-S-PageDown> :bnext<CR>
nmap <silent> <C-S-t> :tab sball<CR>

"map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <C-\> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
map <C-W> :bp\| bd #<CR>

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
let g:tagbar_left=0
let g:tagbar_sort=0

"NERDTree
noremap <S-F2> :NERDTreeToggle<CR>
let NERDTreeMinimalUI=1
noremap <F2> :Explore<CR>

"Fugitive
map <Leader>gd :Gdiff<CR>
map <Leader>gs :Gstatus<CR>
map <Leader>gc :Gcommit<CR>
map <Leader>gb :Gblame<CR>
map <Leader>dp :diffput<CR>
map <Leader>dg :diffget<CR>

" gitgutter
nmap <Leader>hs <Plug>GitGutterStageHunk
nmap <Leader>hu <Plug>GitGutterUndoHunk
nmap <Leader>hv <Plug>GitGutterPreviewHunk

"vim-notes
let g:notes_directories = ['~/notes']
let g:notes_suffix = '.txt'
let g:notes_word_boundaries = 1
let g:notes_conceal_url = 0
let g:notes_tagsindex = '~/notes/tags'

nmap <silent> [l :lprev<CR>
nmap <silent> ]l :lnext<CR>

"YCM
"let g:ycm_min_num_of_chars_for_completion = 3
let g:ycm_min_num_identifier_candidate_chars = 3
let g:ycm_warning_symbol='!!'
let g:ycm_error_symbol='✘✘'
"let g:ycm_complete_in_comments = 1
"let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_tags_files = 0
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_confirm_extra_conf = 0
set completeopt-=preview

" FZF
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>r :History<CR>
nnoremap <Leader>g :Ag<C-R><C-W><CR>
nnoremap <Leader>o :BTags<CR>

" IndentLines
noremap <Leader>il :IndentLinesToggle<CR>

" vim-test
nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ts :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tv :TestVisit<CR>
let g:test#java#maventest#file_pattern='\v^.*[Tt]ests=(Suite)=\.java$'
let test#java#maventest#executable='mvn compiler:compile compiler:testCompile surefire:test'

" javacomplete2
autocmd FileType java setlocal omnifunc=javacomplete#Complete

" golden-ratio
let g:golden_ratio_exclude_nonmodifiable=1

" airline
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1

" ale
let g:ale_sign_error='✘✘'
let g:ale_sign_warning='!!'
let g:ale_linters={
\   'jsx': ['eslint', 'flow'],
\   'javascript.jsx': ['eslint', 'flow'],
\   'javascript': ['eslint', 'flow'],
\}
let g:ale_fixers={
\   'java': ['google_java_format'],
\   'javascript': ['importjs', 'prettier', 'eslint'],
\   'jsx': ['importjs', 'prettier', 'eslint'],
\   'javascript.jsx': ['importjs', 'prettier', 'eslint'],
\}
let g:ale_fix_on_save=1
