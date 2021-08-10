augroup vimrc
  " Remove all autocommands for the current group
  autocmd!

  " Filetype mappings"
  au BufNewFile,BufRead *.txt       setfiletype text
  au BufNewFile,BufRead *.S         setfiletype gas
  au BufNewFile,BufRead *.asm       setfiletype lc3
  au BufNewFile,BufRead *.json      setfiletype javascript
  au BufNewFile,BufRead *.md        setfiletype markdown
  au BufNewFile,BufRead *.th        setfiletype lua
  au BufNewFile,BufRead *.template  setfiletype json
  au BufNewFile,BufRead *.gradle    setfiletype groovy
  au BufNewFile,BufRead *.gradle    setlocal autoindent
  au BufNewFile,BufRead [Dd]ockerfile,Dockerfile.*,*.Dockerfile set filetype=dockerfile

  " 2-space tab for certain filetypes
  au FileType javascript,html,css,ruby,vim,yaml  call s:SetTabSize(2)

  " Enable soft-wrapping for text files
  au FileType text,markdown,html,xhtml,eruby setlocal wrap linebreak nolist

  " Set latex options
  au FileType tex setlocal loaded_delimitMate=1 makeprg=pdflatex\ % indentexpr=

  " Omnicomplete for Ruby
  au FileType ruby setlocal omnifunc=rubycomplete#Complete
  au FileType ruby let g:rubycomplete_buffer_loading=1
  au FileType ruby let g:rubycomplete_classes_in_global=1

  " Omnicomplete for java
  au FileType java setlocal omnifunc=javacomplete#Complete

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  au BufReadPost * call s:JumpToLastPosition()

  " Automatically reread files that have been changed outside of vim and not
  " changed within vim.
  " https://unix.stackexchange.com/a/383044
  au FocusGained,BufEnter * :checktime

  " Automatically load .vimrc source when saved
  au BufWritePost .vimrc source $MYVIMRC

  " Remove trailing whitespace before saving
  au FileType python autocmd BufWritePre * :call s:TrimWhitespace()

  function! s:SetTabSize(size)
    let &tabstop = a:size
    let &softtabstop = a:size
    let &shiftwidth = a:size
  endfunction

  function! s:JumpToLastPosition()
    if line("'\"") > 0 && line("'\"") <= line("$")
      exe "normal g`\""
    endif
  endfunction

  function! s:TrimWhitespace()
    let l:save = winsaveview()
    %s/\s\+$//e
    call winrestview(l:save)
  endfunction

  " Automatically load .vimrc when vim files edited
  autocmd BufWritePost .vimrc,*.vim source $MYVIMRC

augroup END
