" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
filetype off

" Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Bundles
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-sensible'
Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'majutsushi/tagbar'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-notes'
Bundle 'dterei/VimBookmarking'
Bundle 'Indent-Guides'
Bundle 'altercation/vim-colors-solarized'
Bundle 'molokai'
Bundle 'monokai'
Bundle 'badwolf'
Bundle 'darkspectrum'
Bundle 'desert-warm-256'
Bundle 'obvious-resize'
Bundle 'TagHighlight'
Bundle 'Raimondi/delimitMate'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/vimproc.vim'
Bundle 'airblade/vim-gitgutter'
Bundle 'derekwyatt/vim-scala'

" JavaScript
"Bundle 'jelera/vim-javascript-syntax'
"Bundle 'pangloss/vim-javascript'
"Bundle 'marijnh/tern_for_vim'


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
"compiler ~/.bin/jmake          " Set compiler
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

set showbreak=↪

syntax enable
filetype plugin indent on

"Status line
"set statusline=%{g:bufBStr}%#NowBuf#%{g:bufNStr}%#StatusLine#%{g:bufAStr}%<%=%{fugitive#statusline()}[%Y][%c,%l/%L(%P)]

" highlighting trailing spaces
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=#F92672

let g:solarized_hitrail=1
let molokai_original=1

" ---APPEARANCE---
set background=dark
if has("gui_running")
  colorscheme molokai
  "colorscheme darkspectrum
  "colorscheme badwolf
  "colorscheme solarized
  "colorscheme monokai

  set guioptions-=T " hide toolbar
  set guioptions-=m " hide menubar
  "set guioptions-=r " hide scrollbar
  "set guioptions-=R " hide scrollbar
  "set guioptions-=l " hide scrollbar
  "set guioptions-=L " hide scrollbar
  set guitablabel=%!expand(\"\%:t\")

  set cursorcolumn
else
  colorscheme solarized
endif

"set guifont=DejaVu\ Sans\ Mono\ 10
"set guifont=Source\ Code\ Pro\ 10
set guifont=Source\ Code\ Pro\ for\ Powerline\ Medium\ 10

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvs<C-R>=current_reg<CR><Esc>

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " For all text files set 'textwidth' to 80 characters.
  autocmd FileType text setlocal textwidth=80
  autocmd Filetype markdown setlocal textwidth=80
  autocmd Filetype python setlocal shiftwidth=4 tabstop=4
  " use python syntax highlighting for regression test files
  autocmd BufRead,BufNewFile *.yy set filetype=python

  " highlighting trailing spaces
  autocmd VimEnter * match ExtraWhitespace /\s\+\%#\@<!$/

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif

  " vala syntax highlighting
  autocmd BufRead *.vala,*.vapi set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
  autocmd BufRead,BufNewFile *.vala,*.vapi setfiletype vala
endif

" Automatically reload .vimrc when it changes.
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
"Folding control
"nmap <C-S-Right> :foldopen<CR>
nmap <Space> :foldclose<CR>
" Move between windows with alt arrow
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>
nmap <silent> <C-S-t> :tab sball<CR>

map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <C-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

"map <C-S-t> :tag

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
map <silent> <F3> :ToggleBookmark<CR>

"Tagbar
map <F8> :TagbarToggle<CR>
let g:tagbar_left = 0
let g:tagbar_sort = 0
let g:tagbar_type_scala = {
    \ 'ctagstype' : 'Scala',
    \ 'kinds'     : [
        \ 'p:packages:1',
        \ 'V:values',
        \ 'v:variables',
        \ 'T:types',
        \ 't:traits',
        \ 'o:objects',
        \ 'a:aclasses',
        \ 'c:classes',
        \ 'r:cclasses',
        \ 'm:methods'
    \ ]
\ }

"NERDTree
noremap <S-F2> :Explore<CR>
noremap <F2> :NERDTreeToggle<CR>

"Buffer switching
noremap <C-S-PageUp> :bprev<CR>
noremap <C-S-PageDown> :bnext<CR>

"Fugitive
map <Leader>gd :Gdiff<CR>
map <Leader>gs :Gstatus<CR>
map <Leader>gc :Gcommit<CR>
map <Leader>gb :Gblame<CR>

"vim-notes
let g:notes_directories = ['~/notes']
let g:notes_suffix = '.txt'

"Syntastic
let g:syntastic_java_maven_executable='/spgear/zeph_comp_tools/apache-maven-2.2.1/bin/mvn'
let g:syntastic_java_checkers=['javac', 'checkstyle']
let g:syntastic_javascript_checkers=['jshint', 'jslint', 'jsl']
let g:syntastic_warning_symbol = '!!'
let g:syntastic_error_symbol = '✘✘'

"obvious-resize
nmap <silent> <C-S-Up> :ObviousResizeUp<CR>
nmap <silent> <C-S-Down> :ObviousResizeDown<CR>
nmap <silent> <C-S-Left> :ObviousResizeLeft<CR>
nmap <silent> <C-S-Right> :ObviousResizeRight<CR>

"YCM
let g:ycm_min_num_of_chars_for_completion = 3
let g:ycm_min_num_identifier_candidate_chars = 4
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
"let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>', '<Enter>']
let g:ycm_register_as_syntastic_checker = 0
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview

"easytags
let g:easytags_dynamic_files = 1
"let g:easytags_on_cursorhold = 0
let g:easytags_auto_update = 0
let g:easytags_python_enabled = 1

"eclim
let g:EclimCompletionMethod = 'omnifunc'

"Unite
let g:unite_source_history_yank_enable = 1
let g:unite_enable_start_insert = 1
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif
nnoremap <leader>f :Unite -no-split -buffer-name=files file_rec/async<cr>
nnoremap <leader>y :Unite -no-split -buffer-name=yank history/yank<cr>
nnoremap <leader>b :Unite -no-split -buffer-name=buffer buffer<cr>
nnoremap <leader>g :UniteWithCursorWord -no-split -buffer-name=grep grep:.<cr>

"Git Gutter
let g:gitgutter_highlight_lines = 1
