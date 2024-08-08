let mapleader = ","     " Set the map leader

""""""""""""""""""""""""
" Normal mode mappings "
""""""""""""""""""""""""

" Toggle search highlighting
nnoremap <Leader>h :set invhlsearch <CR>

" Opens an edit command with the path of the currently edited file filled in
nnoremap <Leader>e :edit <C-R>=expand("%:h") . "/" <CR>

" Go to definition or declaration
nnoremap <Leader>g :YcmCompleter GoTo<CR>

" Opens a tab edit command with the path of the currently edited file filled in
nnoremap <Leader>te :tabedit <C-R>=expand("%:h") . "/" <CR>

" Open a tag definition in a new tab
nnoremap <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" Open a tag definition in a vertical split
nnoremap <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" Tabularize using space
nnoremap <S-Tab> :Tabularize /:\zs<CR>

" Close preview
inoremap <F2> <C-o>:pclose<CR>
nnoremap <F2> :pclose<CR>

" Reopen file
nnoremap <F5> :edit!<CR>
" Re-hilight
nnoremap <F6> :syntax sync fromstart<CR>

nnoremap <F8> :NERDTreeFind<CR>
" FZF
nnoremap <F9> :FZF<CR>
" Toggle NERD tree
nnoremap <F10> :NERDTreeToggle<CR>
" Toggle tag bar
nnoremap <F11> :TagbarToggle<CR>
" Toggle numbers
nnoremap <F12> :set invnumber<CR>

" coc.nvim Code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" coc.nvim Code navigation in new split
nmap <silent> gsd :<C-u>call CocActionAsync('jumpDefinition', 'split')<CR>
nmap <silent> gsy :<C-u>call CocActionAsync('jumpTypeDefinition', 'split')<CR>
nmap <silent> gsi :<C-u>call CocActionAsync('jumpImplementation', 'split')<CR>
nmap <silent> gsr :<C-u>call CocActionAsync('jumpReferences', 'split')<CR>

" coc.nvim Code navigation in new vsplit
nmap <silent> gvd :<C-u>call CocActionAsync('jumpDefinition', 'vsplit')<CR>
nmap <silent> gvy :<C-u>call CocActionAsync('jumpTypeDefinition', 'vsplit')<CR>
nmap <silent> gvi :<C-u>call CocActionAsync('jumpImplementation', 'vsplit')<CR>
nmap <silent> gvr :<C-u>call CocActionAsync('jumpReferences', 'vsplit')<CR>

" coc.nvim Code navigation in new vsplit
nmap <silent> gD :<C-u>call CocActionAsync('jumpDefinition', 'tabe')<CR>
nmap <silent> gY :<C-u>call CocActionAsync('jumpTypeDefinition', 'tabe')<CR>
nmap <silent> gI :<C-u>call CocActionAsync('jumpImplementation', 'tabe')<CR>
nmap <silent> gR :<C-u>call CocActionAsync('jumpReferences', 'tabe')<CR>

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

" Use tab to trigger CoC completion
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

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
