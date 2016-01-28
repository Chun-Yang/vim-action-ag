" vim-ag-anying.vim ag anything
" Maintainer:   Chun Yang <http://github.com/Chun-Yang>
" Version:      1.0

if exists("g:loaded_vim_ag_anything") || &cp || v:version < 700
  finish
endif
let g:loaded_vim_ag_anything = 1

function! s:Ag(type,...) abort
  if a:type !=# "char"
    return
  endif

  let reg_save = @@

  " copy selected text to @@ register
  silent exe "normal! `[v`]y"
  exe ':Ag "' . @@ . '"'

  let @@ = reg_save
endfunction

nnoremap <silent> <Plug>AgAnything :<C-U>set opfunc=<SID>Ag<CR>g@iw

nmap * <Plug>AgAnything
