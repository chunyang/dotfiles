" Plugins and plugin options

" https://github.com/gmarik/vundle
" http://mg.pov.lt/vim/vimrc
set rtp+=~/.vim/bundle/Vundle.vim

if filereadable(expand($HOME) . '/.vim/bundle/Vundle.vim/autoload/vundle.vim')
  call vundle#begin()

  Plugin 'VundleVim/Vundle.vim'
  Plugin 'derekwyatt/vim-scala'
  Plugin 'scrooloose/nerdcommenter'
  Plugin 'scrooloose/nerdtree'
  Plugin 'jiangmiao/auto-pairs'
  Plugin 'majutsushi/tagbar'
  Plugin 'SirVer/ultisnips'
  "Plugin 'honza/vim-snippets'
  Plugin 'tpope/vim-endwise'
  Plugin 'tpope/vim-fugitive'
  Plugin 'tpope/vim-surround'
  "Plugin 'tpope/vim-cucumber'
  "Plugin 'tpope/vim-rails'
  "Plugin 'colorfulgrayscale/vim-arff'
  Plugin 'godlygeek/tabular'
  Plugin 'plasticboy/vim-markdown'  " Requires tabular
  Plugin 'jQuery'
  "Plugin 'pig.vim'
  Plugin 'Rename'
  "Plugin 'Align'
  "Plugin 'javacomplete'
  "Plugin 'matrix.vim--Yang'
  Plugin 'Valloric/YouCompleteMe'

  " YouCompleteMe build instructions:
  " https://github.com/Valloric/YouCompleteMe
  "   cd ~/.vim/bundle/YouCompleteMe
  "   ./install.py --go-completer --js-completer --clang-completer \
  "     --system-libclang # if on Arch Linux
  "   vim (:PluginInstall!))

  call vundle#end()

endif

" Reload runtime path
" https://github.com/VundleVim/Vundle.vim/issues/176
"filetype off
"filetype on

" YouCompleteMe default ycm_extra_conf
let g:ycm_key_invoke_completion = '<C-.>'
let g:ycm_global_ycm_extra_conf = '/home/cyang/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'

" UltiSnips and YCM conflict bindings
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
