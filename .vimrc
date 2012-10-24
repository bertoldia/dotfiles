" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

call pathogen#infect()

" ---OPTIONS---

" allow backspacing over everything in insert mode
" backspace and cursor keys wrap to previous/next line
set backspace=indent,eol,start whichwrap+=<,>,[,]
set autoindent smartindent      " always set autoindenting on
set history=100                 " keep 50 lines of command line history
set ruler                       " show the cursor position all the time
set showcmd                     " display incomplete commands
set incsearch                   " do incremental searching
set hlsearch
set tabpagemax=30               " max number of tabs to use when using -p option
set autochdir                   " make cwd the current buffer's home
set autoread                    " auto-load files if they are changed outside of vim
set hidden                      " When I close a tab don't remove the buffer
let g:clipbrdDefaultReg = '+'
set grepprg=grep\ -nH\ $*
set expandtab                   " make tabs spaces
set shiftwidth=2                " for auto and manual indent
set tabstop=2                   " pressing tab inserts 2 spaces
set smarttab                    " treat spaces as tabs
set nu                          " line number
"Folding
set foldmethod=syntax
set foldcolumn=3
"set foldclose=all
set foldlevel=1
set foldnestmax=5
set spl=en spell                " spell-checklanguage
set spell                       " spell-check on
"compiler ~/.bin/jmake           " Set compiler
set switchbuf=usetab,newtab     " Buffer control options
" Cool tab completion stuff
set wildmenu
set wildmode=list:full
set mouse=a                     " Enable mouse support in console
set ignorecase                  " Ignoring case is a fun trick
set smartcase                   " And so is Artificial Intelligence!
set tags=./tags;/               " search for a tags file staring at current file's wd and going up until one is fond
set cst                          "to select tag when there are multiple matches
" highlight current line and column, and set the red line over there ->
set cursorline
set colorcolumn=80
set showmode
"set textwidth=80
set wrap linebreak

syntax enable
filetype on
filetype plugin on

"Status line
set laststatus=2                " Pretty status line
set statusline=%f%=%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}

" ---APPEARANCE---
if has("gui_running")
  "colorscheme axel
  "colorscheme rootwater
  "colorscheme wombat
  "colorscheme tango2
  "colorscheme darkspectrum
  "colorscheme molokai
  "colorscheme two2tango
  "colorscheme earendel
  "colorscheme jellybeans
  "colorscheme rdark
  "colorscheme molokai
  colorscheme two2tango

  set guioptions-=T " hide toolbar
  set guioptions+=l " always show scrollbar
  set guioptions+=r " always show scrollbar

  set cursorcolumn
else
   colorscheme evening
endif

set guifont=DejaVu\ Sans\ Mono\ 9
"set guifont=Source\ Code\ Pro\ 9

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvs<C-R>=current_reg<CR><Esc>

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  filetype plugin indent on

  " For all text files set 'textwidth' to 80 characters.
  autocmd FileType text setlocal textwidth=80
  autocmd Filetype markdown setlocal textwidth=80
  autocmd Filetype python setlocal shiftwidth=4 tabstop=4

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif

  " highlighting trailing spaces
  highlight ExtraWhitespace ctermbg=red guibg=red
  autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
  autocmd InsertLeave * match ExtraWhitespace /\s\+\%#\@<!$/

  " use python syntax highlighting for regression test files
  autocmd BufRead,BufNewFile *.yy set filetype=python

  " vala syntax highlighting
  autocmd BufRead *.vala,*.vapi set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
  autocmd BufRead,BufNewFile *.vala,*.vapi setfiletype vala
endif


"re-mappings
" Don't use Ex mode, use Q for formatting
map Q gq
map <C-n> :tabnew<CR>
map <C-A-v> :vsplit<CR>
map <C-l> :wa<CR> :!rubber --force --inplace -pdf %<CR>
noremap <C-A-h> :w<CR> :!$HOME/.bin/mkd2html "%"<CR>
map <C-b> :w<CR> :!pdflatex %<CR>
" copy/paste
map <A-c> "+y
map <A-v> "+gP
"Folding control
"nmap <C-S-Right> :foldopen<CR>
nmap <Space> :foldclose<CR>
" Move between windows with alt arrow
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <C-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
map <C-t> <C-w>T

" misspellings
:iabbrev teh the
:iabbrev ans and
:syntax keyword WordError teh
:syntax keyword WordError ans

" Select all
noremap <C-a> ggVG

" insert date time when I type "dts"
iab <expr> dts strftime("%c")


" >>>>>>>>>>>>>>>>>>>> Plugins Behaviour Modifications <<<<<<<<<<<<<<<<<<<<<<<

"Bookmarking. These colors work best with molokai theme
hi default BookmarkHighlightLine ctermbg=lightblue guibg=#ce5c00 cterm=bold gui=bold
hi default BookmarkHighlightText ctermbg=lightblue guibg=#ce5c00 cterm=bold gui=bold
"sign define bookmark text=• linehl=BookmarkHighlightLine texthl=BookmarkHighlightText
map <silent> <S-F3> :ClearBookmark<CR>

"Tagbar
map <F8> :TagbarToggle<CR>
let g:tagbar_left = 0
let g:tagbar_sort = 0

"NERDTree
noremap <S-F2> :Explore<CR>
noremap <F2> :NERDTreeToggle<CR>

"Buffer switching
noremap <C-S-PageUp> :bprev<CR>
noremap <C-S-PageDown> :bnext<CR>

"Bufkill
noremap <C-w> :BW<CR>

"Fugitive
map  <Leader>gd  :Gdiff<CR>

"LustyJuggler
noremap <Leader>aa :LustyJuggler<CR>

"BufExplorer
noremap <Leader>ss :BufExplorer<CR>
