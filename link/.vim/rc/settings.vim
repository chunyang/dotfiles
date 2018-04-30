" Vim settings

filetype plugin indent on

set history=50      " keep 50 lines of command line history
set scrolloff=3     " Keep some lines above and below cursor for context
set sidescroll=1    " Allow smooth side scrolling
set sidescrolloff=8 " Keep some columns left and right for context
set ruler           " show the cursor position all the time
set showcmd         " display incomplete commands
set confirm
set autoread

if has('statusline')
  set laststatus=2    " Always display the status line

  if exists('*fugitive#statusline')
    set statusline=%f\ %m%r%h%w%y%=%{fugitive#statusline()}\ %3l,%3c\ \ %P
  else
    set statusline=%f\ %m%r%h%w%y%=%3l,%3c\ \ %P
  endif
endif

set incsearch       " do incremental searching
set hlsearch        " Highlight last search pattern
set ignorecase      " case only matters when there are capital letters
set smartcase

set nojoinspaces
set nowrap          " Don't soft-wrap text
set textwidth=80
set formatoptions=crq2lj
"set formatoptions-=ot

set copyindent      " Try to match current file's indent
set tabstop=4       " Default indent options
set softtabstop=4
set shiftwidth=4
set expandtab

set tags+=./tags;/  " Look for tags file in parent directories

" Tab completion options
" (only complete to the longest unambiguous match, and show a menu)
set completeopt=longest,menu,preview
set wildmode=list:longest,list:full
set complete=.,w,b,u,t,i

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Display extra whitespace
" http://stackoverflow.com/questions/1675688/
" set list listchars=tab:»·,trail:·
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

" Ignore certain filetypes during filename completion
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.pdf,.out,.pyc,.class

" Switch syntax highlighting on, when the terminal has colors
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on

  " Highlight long lines
  if exists('+colorcolumn')
    set colorcolumn=+1,+2
  endif

  " Set color scheme
  if $TERM =~ '^rxvt-.*' || $TERM=~ 'tmux' || $TERM =~ '256color$'
    " Force 256 colors
    set t_Co=256

    let g:molokai_original=0
    colorscheme molokai-custom
  endif

endif

" Allow mouse usage if possible
if has('mouse')
  set mouse=a
endif

if $TERM =~ "rxvt-unicode"
  set ttymouse=urxvt
endif

let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }

let g:tagbar_type_make = {
  \ 'kinds':[
    \ 'm:macros',
    \ 't:targets'
  \ ]
\ }

" html/js indent logging
let g:js_indent_log = 0


