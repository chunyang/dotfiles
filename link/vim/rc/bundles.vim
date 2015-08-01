" Bundles and bundle options

" https://github.com/gmarik/vundle
" http://mg.pov.lt/vim/vimrc
if has("user_commands")
  set rtp+=~/.vim/bundle/Vundle.vim
endif

if exists('*vundle#begin')
  call vundle#begin()
  Bundle 'Valloric/YouCompleteMe'

  " YouCompleteMe build instructions:
  " https://github.com/Valloric/YouCompleteMe
  "   cd ~
  "   mkdir ycm_build
  "   cd ycm_build
  "   cmake -G "Unix Makefiles" \
  "     -DEXTERNAL_LIBCLANG_PATH=/usr/lib/libclang.so \
  "     . ~/.vim/bundle/YouCompleteMe/cpp
  "   make
  "   vim (:BundleInstall!))

  call vundle#end()

endif

" YouCompleteMe default ycm_extra_conf
let g:ycm_key_invoke_completion = '<C-.>'
let g:ycm_global_ycm_extra_conf = '/home/cyang/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'

" UltiSnips and YCM conflict bindings
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"

" Reload runtime path
" https://github.com/VundleVim/Vundle.vim/issues/176
filetype off
filetype on
