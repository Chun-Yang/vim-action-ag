" vim-ag-anying.vim ag anything
" Maintainer:   Chun Yang <http://github.com/Chun-Yang>
" Version:      1.0

if exists("g:loaded_vim_ag_anything") || &cp || v:version < 700
  finish
endif
let g:loaded_vim_ag_anything = 1

nnoremap ga :echom 'Install'<CR>
