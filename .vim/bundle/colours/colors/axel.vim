" =============================================================================
" Name: axel
" Purpose: Another colour scheme using the Tango colour palette based on tango2
" Maintainer: Axel von Bertoldi
" Last Modified: December 4, 2008
" =============================================================================

set background=dark
hi clear
if exists("syntax-on")
syntax reset
endif

let colors_name = "axel"

" =============================================================================
" Vim >= 7.0 specific colours
" =============================================================================

if version >= 700
" No support for cursor line yet
" hi CursorLine term=underline cterm=underline guibg=#111133
" hi CursorColoumn
" hi MatchParen
" hi Pmenu
" hi PmenuSel
endif

" =============================================================================
" General colours
" =============================================================================

hi Normal guibg=#2E3436 guifg=#eeeeec 
hi Cursor guibg=#ce5c00 guifg=Black

" Default Colors
hi Normal guifg=#babdb6 guibg=#1e2426
hi NonText guifg=#2c3032 guibg=#2c3032 gui=none
hi Cursor guibg=#babdb6
hi ICursor guibg=#babdb6

hi Folded guibg=#4D585B guibg=#d2d2d2
" No fold column support yet 
" hi FoldColumn guifg=Orange guibg=DarkBlue
" =============================================================================
" Syntax highlighting
" =============================================================================

"hi Comment gui=italic guifg=#6d7e8a ctermfg=Grey
"hi Comment gui=italic guifg=#C4A000
hi Comment gui=italic guifg=#888a85
hi Todo term=bold guifg=#EBC450 
hi Constant guibg=Black guifg=#FCE94F
hi Constant guibg=Black guifg=#8ae234
hi Number guifg=#8ae234
hi Special guifg=#C4A000 guibg=Black
hi Type guifg=#8AE234
hi Function gui=bold guifg=#9BCF8D
hi Statement guifg=#729FCF
hi Identifier guifg=#AD7FA8
hi PreProc guifg=#EF2929
hi Special term=underline guifg=#5EAFE5
hi Search guifg=Black guibg=#4E9A06
