if exists('g:GtkGuiLoaded')
  call rpcnotify(1, 'Gui', 'Font', 'Source Code Pro Medium 10')
  call rpcnotify(1, 'Gui', 'Option', 'Tabline', 0)
  let g:GuiInternalClipboard=1
  colorscheme nova
else
  Guifont Source Code Pro Semibold::h10
endif
