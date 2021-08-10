" Plugins and plugin options

if filereadable(expand($HOME) . '/.vim/autoload/plug.vim')
  call plug#begin('~/.vim/plugged')

  Plug 'junegunn/vim-plug'

  " General
  Plug 'scrooloose/nerdcommenter'
  Plug 'scrooloose/nerdtree'
  Plug 'majutsushi/tagbar'
  "Plug 'jiangmiao/auto-pairs'
  Plug 'Raimondi/delimitMate'
  Plug 'SirVer/ultisnips'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-surround'
  Plug 'godlygeek/tabular'
  Plug 'vim-scripts/Rename'
  Plug 'tmux-plugins/vim-tmux-focus-events'
  "Plugin 'Valloric/YouCompleteMe'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  "Plug 'honza/vim-snippets'
  "Plug 'Align'

  " Git
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'

  " Python
  Plug 'Vimjas/vim-python-pep8-indent'
  Plug 'psf/black', {'tag': '19.10b0'}
  Plug 'raimon49/requirements.txt.vim'

  " C++
  Plug 'octol/vim-cpp-enhanced-highlight'

  " Scala
  " Plug 'derekwyatt/vim-scala'

  " Ruby
  "Plug 'tpope/vim-cucumber'
  "Plug 'tpope/vim-rails'

  " Other
  "Plug 'colorfulgrayscale/vim-arff'
  "Plug 'pig.vim'
  "Plug 'javacomplete'
  "Plug 'matrix.vim--Yang'

  " Markdown
  Plug 'plasticboy/vim-markdown'  " Requires tabular

  " Postgres
  Plug 'lifepillar/pgsql.vim'

  " Golang
  Plug 'fatih/vim-go'

  " Javascript
  "Plug 'jQuery'
  Plug 'pangloss/vim-javascript'
  Plug 'mxw/vim-jsx'
  Plug 'flowtype/vim-flow'
  Plug 'styled-components/vim-styled-components'

  " Terraform
  Plug 'hashivim/vim-terraform'

  " TOML
  Plug 'cespare/vim-toml'

  " YouCompleteMe build instructions:
  " https://github.com/Valloric/YouCompleteMe
  "   cd ~/.vim/bundle/YouCompleteMe
  "   ./install.py --go-completer --js-completer --clang-completer \
  "     --system-libclang # if on Arch Linux
  "   vim (:PluginInstall!))

  call plug#end()

endif

" YouCompleteMe default ycm_extra_conf
let g:ycm_key_invoke_completion = '<C-.>'
let g:ycm_global_ycm_extra_conf = '/home/cyang/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'

" UltiSnips and YCM conflict bindings
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"

" Disable multiline close
let g:AutoPairsMultilineClose = 0
" Don't auto-pair single and double quotes
let g:AutoPairs = {'(':')', '[':']', '{':'}', "`":"`"}

" Github enterprise links
let g:github_enterprise_urls = ['https://github.robot.car']

" Black
let g:black_linelength = 99

" CoC
let g:coc_disable_startup_warning = 1
