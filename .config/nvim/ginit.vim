colorscheme nova

if exists('g:GtkGuiLoaded')
  call rpcnotify(1, 'Gui', 'Font', 'Source Code Pro Medium 10')
  call rpcnotify(1, 'Gui', 'Option', 'Tabline', 0)
  let g:GuiInternalClipboard=1
else
  Guifont Source Code Pro Medium::h10
  GuiLinespace 2

  let g:gonvim_draw_statusline = 1
  let g:gonvim_draw_tabline = 1
  let g:gonvim_draw_lint = 1
  let g:gonvim_draw_split = 1
endif
