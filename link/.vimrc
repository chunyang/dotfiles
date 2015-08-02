" .vimrc
"
" chunyang's .vimrc

" based on http://github.com/jferris/config_files/blob/master/vimrc

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Load bundles and bundle options
if filereadable(expand($HOME) . "/.vim/rc/vundle.vim")
  source $HOME/.vim/rc/vundle.vim
endif

" Load settings
if filereadable(expand($HOME) . "/.vim/rc/settings.vim")
  source $HOME/.vim/rc/settings.vim
endif

" Load autocommands
if has("autocmd")
  if filereadable(expand($HOME) . "/.vim/rc/autocmd.vim")
    source $HOME/.vim/rc/autocmd.vim
  endif
else
  set autoindent
endif

" Load key mappings
if filereadable(expand($HOME) . "/.vim/rc/keymap.vim")
  source $HOME/.vim/rc/keymap.vim
endif

" Local config
if filereadable(".vimrc.local")
  source .vimrc.local
endif
