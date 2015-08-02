augroup vimrc
  " Remove all autocommands for the current group
  autocmd!

  " Filetype mappings"
  au BufNewFile,BufRead *.txt   setfiletype text
  au BufNewFile,BufRead *.S     setfiletype gas
  au BufNewFile,BufRead *.asm   setfiletype lc3
  au BufNewFile,BufRead *.json  setfiletype javascript
  au BufNewFile,BufRead *.md    setfiletype markdown

  " 2-space tab for certain filetypes
  au FileType javascript,html,css,ruby,vim  call s:SetTabSize(2)

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

  " Automatically load .vimrc source when saved
  au BufWritePost .vimrc source $MYVIMRC

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

  " Automatically load .vimrc when vim files edited
  autocmd BufWritePost .vimrc,*.vim source $MYVIMRC

augroup END
