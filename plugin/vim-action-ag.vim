" vim-ag-anying.vim ag anything
" Maintainer:   Chun Yang <http://github.com/Chun-Yang>
" Version:      1.0

if exists("g:loaded_vim_action_ag") || &cp || v:version < 700
  finish
endif
let g:loaded_vim_action_ag = 1

" http://stackoverflow.com/questions/399078/what-special-characters-must-be-escaped-in-regular-expressions
let g:vim_action_ag_escape_chars = get(g:, 'vim_action_ag_escape_chars', '#%.^$*+?()[{\\|')

function! s:Ag(mode) abort
  " preserver @@ register
  let reg_save = @@

  " copy selected text to @@ register
  if a:mode ==# 'v' || a:mode ==# ''
    silent exe "normal! `<v`>y"
  elseif a:mode ==# 'char'
    silent exe "normal! `[v`]y"
  else
    return
  endif

  " prepare for search highlight
  let escaped_for_vim = escape(@@, '/\')
  exe ":let @/='\\V".escaped_for_vim."'"

  " escape special chars,
  " % is file name in vim we need to escape that first
  " # is secial in ag
  let escaped_for_ag = escape(@@, '%#')
  let escaped_for_ag = escape(escaped_for_ag, g:vim_action_ag_escape_chars)

  " execute Ag command
  " '!' is used to NOT jump to the first match
  exe ":Ag!" "'".escaped_for_ag."'"

  " go to the first search match
  normal! n

  " recover @@ register
  let @@ = reg_save
endfunction

" NOTE: set hlsearch does not work in a function
vnoremap <silent> <Plug>AgActionVisual :<C-U>call <SID>Ag(visualmode())<CR>
nnoremap <silent> <Plug>AgAction       :set hlsearch<CR>:<C-U>set opfunc=<SID>Ag<CR>g@
nnoremap <silent> <Plug>AgActionWord   :set hlsearch<CR>:<C-U>set opfunc=<SID>Ag<CR>g@iw

vmap gag <Plug>AgActionVisual
nmap gag <Plug>AgAction
