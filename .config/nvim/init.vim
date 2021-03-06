call plug#begin('~/.config/nvim/bundle')
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
  Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
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
  Plug 'zchee/deoplete-go', {'do': 'make', 'for': 'go'}
  " Rust
  Plug 'rust-lang/rust.vim', {'for': 'rust'}
  Plug 'sebastianmarkow/deoplete-rust', {'for': 'rust'}
  "Javascript
  Plug 'pangloss/vim-javascript', {'for': ['javascript', 'javascript.jsx']}
  Plug 'mxw/vim-jsx', {'for': 'javascript.jsx'}
  Plug 'carlitux/deoplete-ternjs', {'for': 'javascript.jsx'}
  " Python
  Plug 'zchee/deoplete-jedi', {'for': 'python'}

  " Colors
  Plug 'morhetz/gruvbox'
  Plug 'ajmwagar/vim-deus'
  Plug 'rdavison/Libertine'
  Plug 'zanglg/nova.vim'
  Plug 'skielbasa/vim-material-monokai'

  " Misc
  Plug 'ludovicchabant/vim-gutentags'
  Plug 'equalsraf/neovim-gui-shim'
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
set clipboard+=unnamedplus
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
set completeopt=longest,menuone,preview

"Change cursor shape and colour in insert mode
set guicursor=n-v-c-sm:block-blinkon1,i-ci-ve:ver30-blinkon1,r-cr-o:hor20

set showbreak=↪

syntax enable
filetype plugin indent on

" ---APPEARANCE---
set background=dark
colorscheme gruvbox

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

" Automatically reload .nvimrc when it changes.
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
map <C-S-W> :bp\| bd! #<CR>

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
let g:tagbar_type_rust={
    \ 'ctagstype' : 'rust',
    \ 'kinds' : [
        \'T:types,type definitions',
        \'f:functions,function definitions',
        \'g:enum,enumeration names',
        \'s:structure names',
        \'m:modules,module names',
        \'c:consts,static constants',
        \'t:traits,traits',
        \'i:impls,trait implementations',
    \]
    \}

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

nmap <silent> [l :lprev<CR>
nmap <silent> ]l :lnext<CR>

" FZF
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>r :History<CR>
nnoremap <Leader>g :Ag <C-R><C-W><CR>
nnoremap <Leader>o :BTags<CR>
nnoremap <Leader>m :call fzf#run({'sink': 'e', 'options': '--multi'})<CR>
nnoremap <Leader>gf :call fzf#run({'source': 'git files', 'sink': 'e', 'options': '--multi'})<CR>

" IndentLines
noremap <Leader>il :IndentLinesToggle<CR>

" vim-test
let test#strategy="neovim"
nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ts :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tv :TestVisit<CR>
let g:test#java#maventest#file_pattern='\v^.*[Tt]ests=(Suite)=\.java$'
let test#java#maventest#executable='mvn -T2C compiler:compile compiler:testCompile surefire:test'

" javacomplete2
autocmd FileType java setlocal omnifunc=javacomplete#Complete
nmap <F5> <Plug>(JavaComplete-Imports-Add)
nmap <F6> <Plug>(JavaComplete-Imports-AddMissing)

" deoplete
let g:deoplete#enable_at_startup=1
let g:deoplete#enable_smart_case=1
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" vim-go
let g:deoplete#sources#go#gocode_binary='$HOME/.go/bin/gocode'
" open test/implementation file in a vsplit instead of the same window
let g:go_alternate_mode="vsplit"
let g:go_fmt_command="goimports"
let g:go_highlight_functions=1
let g:go_highlight_methods=1
let g:go_term_enabled=1
nmap <silent> <leader>gc :GoCoverage<CR>
nmap <silent> <leader>gt :GoTest<CR>

" rust
let g:rustfmt_autosave=1
let g:deoplete#sources#rust#racer_binary='/usr/bin/racer'
let g:deoplete#sources#rust#rust_source_path='/usr/src/rust/src'

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
\   'javascript': ['importjs', 'eslint'],
\   'jsx': ['importjs', 'eslint'],
\   'javascript.jsx': ['importjs', 'eslint'],
\   'json': ['prettier'],
\   'python': ['autopep8', 'isort'],
\}
let g:ale_fix_on_save=1
let g:ale_java_google_java_format_options='--aosp'
