if exists('g:GtkGuiLoaded')
  call rpcnotify(1, 'Gui', 'Font', 'Source Code Pro Regular 10')
  "call rpcnotify(1, 'Gui', 'Font', 'Fira Code Medium 10')
  call rpcnotify(1, 'Gui', 'Option', 'Tabline', 0)
else
  Guifont Source Code Pro Medium::h10
endif
