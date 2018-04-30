" Plugins and plugin options

" https://github.com/gmarik/vundle
" http://mg.pov.lt/vim/vimrc
set rtp+=~/.vim/bundle/Vundle.vim

if filereadable(expand($HOME) . '/.vim/bundle/Vundle.vim/autoload/vundle.vim')
  call vundle#begin()

  Plugin 'VundleVim/Vundle.vim'

  " General
  Plugin 'scrooloose/nerdcommenter'
  Plugin 'scrooloose/nerdtree'
  Plugin 'majutsushi/tagbar'
  Plugin 'jiangmiao/auto-pairs'
  Plugin 'SirVer/ultisnips'
  Plugin 'tpope/vim-endwise'
  Plugin 'tpope/vim-surround'
  Plugin 'godlygeek/tabular'
  Plugin 'Rename'
  Plugin 'tmux-plugins/vim-tmux-focus-events'
  Plugin 'Valloric/YouCompleteMe'
  "Plugin 'honza/vim-snippets'
  "Plugin 'Align'

  " Git
  Plugin 'tpope/vim-fugitive'

  " C++
  Plugin 'octol/vim-cpp-enhanced-highlight'

  " Scala
  " Plugin 'derekwyatt/vim-scala'

  " Ruby
  "Plugin 'tpope/vim-cucumber'
  "Plugin 'tpope/vim-rails'

  " Other
  "Plugin 'colorfulgrayscale/vim-arff'
  "Plugin 'pig.vim'
  "Plugin 'javacomplete'
  "Plugin 'matrix.vim--Yang'

  " Markdown
  Plugin 'plasticboy/vim-markdown'  " Requires tabular

  " Postgres
  Plugin 'lifepillar/pgsql.vim'

  " Golang
  Plugin 'fatih/vim-go'

  " Javascript
  "Plugin 'jQuery'
  Plugin 'pangloss/vim-javascript'
  Plugin 'mxw/vim-jsx'
  Plugin 'flowtype/vim-flow'
  Plugin 'styled-components/vim-styled-components'

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
