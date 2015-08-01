let mapleader = ","     " Set the map leader

""""""""""""""""""""""""
" Normal mode mappings "
""""""""""""""""""""""""

" Toggle search highlighting
nnoremap <Leader>h :set invhlsearch <CR>

" Opens an edit command with the path of the currently edited file filled in
nnoremap <Leader>e :edit <C-R>=expand("%:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled in
nnoremap <Leader>te :tabedit <C-R>=expand("%:h") . "/" <CR>

" Open a tag definition in a new tab
nnoremap <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" Open a tag definition in a vertical split
nnoremap <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" Tabularize using space
nnoremap <S-Tab> :Tabularize /:\zs<CR>

" Reopen file
nnoremap <F5> :edit!<CR>
" Re-hilight
nnoremap <F6> :syntax sync fromstart<CR>
" Toggle tag list
nnoremap <F10> :TlistToggle<CR>
" Toggle NERD tree
nnoremap <F11> :NERDTreeToggle<CR>
" Toggle numbers
nnoremap <F12> :set invnumber<CR>

" Open URL
command! -bar -nargs=1 OpenURL :!open <args>
function! OpenURL()
  let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;:]*')
  echo s:uri
  if s:uri != ""
	  exec "!open \"" . s:uri . "\""
  else
	  echo "No URI found in line."
  endif
endfunction
map <Leader>w :call OpenURL()<CR>

""""""""""""""""""""""""
" Insert mode mappings "
""""""""""""""""""""""""

" Fast exit out of insert mode
inoremap kj <Esc>

" Insert the current file name
inoremap <C-F> <C-R>=expand("%")<CR>

inoremap <C-L> <Space>=><Space>

""""""""""""""""""""""""
" Visual mode mappings "
""""""""""""""""""""""""

" Duplicate a selection
vnoremap D y'>p

" Replace the selection without overwriting the default register
vnoremap P p :call setreg('"', getreg('0')) <CR>

"""""""""""""""""""""""""
" Command mode mappings "
"""""""""""""""""""""""""

" Inserts the path of the currently edited file into a command
cnoremap <C-P> <C-R>=expand("%:h") . "/" <CR>
